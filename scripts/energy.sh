#!/bin/sh
# П. 3: енерговитрати через powermetrics (потрібен пароль)
# запуск: ./scripts/energy.sh O0 2000 1   або   ./scripts/energy.sh O3 2000 20
#   третій параметр = скільки разів запустити програму поспіль
set -e
VER=$1
ROUNDS=${2:-2000}
REPEAT=${3:-1}
OUT=results/energy_$VER
now() { perl -MTime::HiRes=time -e 'printf "%.3f\n", time'; }

# 1. система у спокої: 10 замірів по 1 с
sudo powermetrics --samplers cpu_power -i 1000 -n 10 > ${OUT}_idle.txt 2>/dev/null

# 2. система під час роботи програми (кожну 1 с: потужність CPU і список процесів)
sudo powermetrics --samplers cpu_power,tasks --show-process-energy -i 1000 > ${OUT}_run.txt 2>/dev/null &
sleep 2
START=$(now)
for i in $(seq $REPEAT); do
    ./build/arrays_$VER $ROUNDS > /dev/null
done
END=$(now)
sleep 1
sudo pkill powermetrics
echo "$END - $START" | bc > ${OUT}_time.txt

# 3. розрахунок
./scripts/energy_calc.sh $VER $REPEAT
echo "energy impact програми (остання колонка):"
grep "arrays_$VER" ${OUT}_run.txt | head -5
