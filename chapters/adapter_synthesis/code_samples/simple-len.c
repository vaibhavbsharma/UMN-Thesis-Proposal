int isP1(const char *s) {
  const char *p = s + strlen(s) - 1;
  while (s < p)
  if (*p-- != *s++)
    return 0;
  return 1;
}

int isP2(const char *start, size_t len) {
  int i;
  int pal = 1;
  for(i = 0; ((i <= len/2) && (pal==1)); i++) {
    if(start[i] != start[len-i-1])
      pal = 0;
  }
  return pal;
}

int adapted_isP2(const char *s) {
  isP2(s, strlen(s));
}

