#define N 4
void naive_mm(int** C, int** A, int** B) {
  int i, j, k;
  for ( i = 0; i < N; i++)
    for ( j = 0; j < N; j++) {
      C[i][j] = 0;
      for ( k = 0; k < N; k++)
        C[i][j] += A[i][k]*B[k][j];
    }
}
