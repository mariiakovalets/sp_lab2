#!/bin/sh
# П. 3: розрахунок енергії з файлів powermetrics (викликається з energy.sh)
# запуск: ./scripts/energy_calc.sh O0 1   або   ./scripts/energy_calc.sh O3 20
VER=$1
REPEAT=${2:-1}
OUT=results/energy_$VER
T=$(cat ${OUT}_time.txt)

# середня потужність CPU у спокої (мВт)
P_IDLE=$(grep "CPU Power" ${OUT}_idle.txt | awk '{s += $3; n++} END {printf "%.0f", s / n}')

# середня потужність CPU під час роботи (мВт): беремо тільки заміри, де видно програму,
# і пропускаємо перший з них, бо він захопив частину секунди до старту
P_RUN=$(awk -v name="arrays_$VER" '
    /Sampled system activity/ { if (has) { k++; if (k > 1) { s += p; n++ } } has = 0 }
    $1 == name               { has = 1 }
    /^CPU Power/             { p = $3 }
    END                      { printf "%.0f", s / n }' ${OUT}_run.txt)

# енергія (Дж) = потужність (Вт) × час (с)
E_SYS=$(echo "scale=2; $P_RUN * $T / 1000" | bc)
E_PROG=$(echo "scale=2; ($P_RUN - $P_IDLE) * $T / 1000" | bc)
E_ONE=$(echo "scale=2; $E_PROG / $REPEAT" | bc)

{
echo "версія:                       $VER, запусків: $REPEAT"
echo "час роботи:                   $T с"
echo "CPU у спокої:                 $P_IDLE мВт"
echo "CPU під час роботи:           $P_RUN мВт"
echo "енергія системи (CPU):        $E_SYS Дж"
echo "енергія тільки програми:      $E_PROG Дж"
echo "енергія одного запуску:       $E_ONE Дж"
} | tee ${OUT}_summary.txt
