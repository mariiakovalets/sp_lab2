# Лабораторна робота 2: профілювання програми

Програма `src/arrays.cpp` (C++20) обробляє масив з 1 млн чисел: множить кожне число, рахує суму
і кількість чисел, більших за поріг. Кількість повторів задається аргументом.
Порівнюються дві версії тієї самої програми: `-O0` (без оптимізації) і `-O3`.

Платформа: Mac з чипом Apple M3 (ARM64), macOS, компілятор GCC 15.2 (Homebrew).
`perf` є тільки на Linux, тому
використовуються аналоги macOS:

| Linux            | macOS                              |
|------------------|------------------------------------|
| `perf record -g` | `sample`                           |
| `perf report`    | розділ "Sort by top of stack" у файлі `.sample` |
| `/usr/bin/time --verbose` | `gtime --verbose` (GNU time з Homebrew) |
| `perf stat -d`   | `/usr/bin/time -l` (cycles, instructions) |
| powerstat, RAPL  | `powermetrics`                     |
| AVX              | NEON (на x86-64 через godbolt.org: AVX2) |

## Підготовка (один раз)

```
brew install gnu-time cmake
git clone https://github.com/brendangregg/FlameGraph
chmod +x scripts/*.sh
```

## Збірка

```
cmake -S . -B build
cmake --build build
cmake --build build --target asm
```

Результат: `build/arrays_O0`, `build/arrays_O3`, `asm/arrays_O0.s`, `asm/arrays_O3.s`.

## Заміри

| Пункт | Команда |
|-------|---------|
| 1, 2.3 (до)  | `./scripts/flame.sh O0 2000` |
| 4.3 (після)  | `./scripts/flame.sh O3 50000` |
| 2.1, 2.2     | `./scripts/stats.sh O0` і `./scripts/stats.sh O3` |
| 3, 4.4       | `./scripts/energy.sh O0 2000 1` і `./scripts/energy.sh O3 2000 20` |
| 4.1, 4.1.1   | порівняти функцію `scale` у `asm/arrays_O0.s` і `asm/arrays_O3.s`; на godbolt.org: x86-64 gcc, `-O0` проти `-O3 -mavx2` |

Перед замірами енергії: закрити інші програми, однакова яскравість екрана,
ноутбук або на зарядці, або без неї для обох версій.

Усі результати зберігаються в `results/`. Енергію з уже записаних файлів можна
перерахувати без нового заміру: `./scripts/energy_calc.sh O0 1`, `./scripts/energy_calc.sh O3 20`.
