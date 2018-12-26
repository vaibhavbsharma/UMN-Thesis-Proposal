int musl_isalpha(int c) {
  return ((unsigned)c|32)-'a' < 26; 
}
int glibc_isalpha(int c) { 
  return table[c] & 1024; 
}
int adapted_isalpha(int c) {
  return (glibc_isalpha(c) != 0) ? 1 : 0; 
}
