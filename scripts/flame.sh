#!/bin/sh
# П. 1 і 2.3: запис стеків викликів і побудова FlameGraph
# запуск: ./scripts/flame.sh O0 2000   або   ./scripts/flame.sh O3 50000
set -e
VER=$1
ROUNDS=${2:-2000}
SAMPLE=logs/sample_$VER.txt
OUT=flamegraphs/flame_$VER

# 1. запускаємо програму у фоні
./build/arrays_$VER $ROUNDS > /dev/null &
PID=$!
sleep 1   # чекаємо, поки програма завантажиться

# 2. sample знімає стек процесу кожну 1 мс протягом 5 с (аналог perf record -g)
sample $PID 5 1 -mayDie -file $SAMPLE
kill $PID 2>/dev/null || true
wait $PID 2>/dev/null || true

# 3. згортаємо стеки в рядки (аналог stackcollapse-perf.pl)
awk -f FlameGraph/stackcollapse-sample.awk $SAMPLE > $OUT.folded

# 4. малюємо графік
./FlameGraph/flamegraph.pl --title "arrays_$VER" $OUT.folded > $OUT.svg
open $OUT.svg
