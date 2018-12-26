int f1(const char *bufIn, size_t bufInLen) {
  int len = -1;
  const char *end;
  end = memchr(bufIn, '\n', bufInLen);
  if (end == NULL) 
    end = strchr(bufIn, '\0');
  len = end - bufIn;
  return isP2(bufIn, len);
}

int f2(const char *s) {
  return isP1(s);
}

int f2_chartrans_adapter(const char *bufIn, size_t bufInLen) {
  int i;
  char *bufIn_copy = (char *) malloc(bufInLen);
  memcpy(bufIn_copy, bufIn, bufInLen);
  for( i = 0; i < bufInLen; i++) {
    if (bufIn_copy[i] == '\n') 
      bufIn_copy[i] = '\0';
  }
  // avoid side-effect on memory
  free(bufIn_copy); 
  return f2(bufIn);
}
