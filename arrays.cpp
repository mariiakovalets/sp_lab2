// arrays.cpp: обробка масиву чисел
// запуск: ./arrays_O0 2000   (2000 = кількість повторів)
#include <iostream>
#include <vector>
#include <string>

const int N = 1000000;   // 1 мільйон чисел

// заповнює масив числами 0..99
void fill(std::vector<int>& a) {
    for (int i = 0; i < (int)a.size(); i++)
        a[i] = i % 100;
}

// кожне число множить на k і додає 1
void scale(const std::vector<int>& a, std::vector<int>& b, int k) {
    for (int i = 0; i < (int)a.size(); i++)
        b[i] = a[i] * k + 1;
}

// сума всіх чисел
long long sum(const std::vector<int>& b) {
    long long s = 0;
    for (int i = 0; i < (int)b.size(); i++)
        s += b[i];
    return s;
}

// скільки чисел більші за поріг
int count_above(const std::vector<int>& b, int limit) {
    int count = 0;
    for (int i = 0; i < (int)b.size(); i++)
        if (b[i] > limit)
            count++;
    return count;
}

int main(int argc, char* argv[]) {
    int rounds = argc > 1 ? std::stoi(argv[1]) : 2000;
    std::vector<int> a(N);
    std::vector<int> b(N);
    long long total = 0;
    long long big = 0;

    fill(a);
    for (int r = 0; r < rounds; r++) {
        scale(a, b, r % 10 + 1);
        total += sum(b);
        big += count_above(b, 500);
    }

    std::cout << "total = " << total << ", big = " << big << std::endl;
    return 0;
}
