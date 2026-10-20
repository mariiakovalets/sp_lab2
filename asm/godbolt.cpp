const int N = 1000000;
int a[N], b[N];

void scale(int k) {
    for (int i = 0; i < N; i++)
        b[i] = a[i] * k + 1;
}
