#!/bin/sh
# П. 2.1 і 2.2: статистика виконання
# запуск: ./scripts/stats.sh O0   або   ./scripts/stats.sh O3
set -e
VER=$1
ROUNDS=${2:-2000}

# GNU time (аналог /usr/bin/time --verbose на Linux)
gtime --verbose ./build/arrays_$VER $ROUNDS 2> logs/time_verbose_$VER.txt

# вбудований time на macOS: на M-чипах показує cycles і instructions (замість perf stat)
/usr/bin/time -l ./build/arrays_$VER $ROUNDS 2> logs/time_l_$VER.txt

cat logs/time_verbose_$VER.txt logs/time_l_$VER.txt
