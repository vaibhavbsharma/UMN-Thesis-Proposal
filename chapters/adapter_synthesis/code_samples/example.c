int target(int x, unsigned y) {
  return (x << 1) + (y % 2);
}
int reference(int a, int b, int c, int d) {
  return c + d + (a & b);
}
int adapted_reference(int x, unsigned y) {
  return target(y, 1, x, x);
}
