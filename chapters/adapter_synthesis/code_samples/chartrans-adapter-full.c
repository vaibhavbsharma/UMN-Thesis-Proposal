#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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

int f1(const char *bufIn, size_t bufInLen)
{
  int len = -1;
  const char *end;
  end = memchr(bufIn, '\n', bufInLen);
  if (end == NULL) 
    end = strchr(bufIn, '\0');
  len = end - bufIn;
  return isP2(bufIn, len);
}

int f2(const char *s)
{
  return isP1(s);
}

int f2_chartrans_adapter(const char *bufIn, size_t bufInLen)
{
  int i;
  char *bufIn_copy = (char *) malloc(bufInLen);
  memcpy(bufIn_copy, bufIn, bufInLen); // copy input
  for( i = 0; i < bufInLen; i++) {
    if (bufIn_copy[i] == '\n') 
      bufIn_copy[i] = '\0';
  }
  // free input copy to avoid side-effect on memory
  free(bufIn_copy);
  return f2(bufIn);
}

int main() {
	char s[20];;
	int l=3;
	scanf("%s",s);
	printf("%d %d %d\n", f1(s,l), f2(s), f2_chartrans_adapter(s,l));
	return 0;
}
