void compare(x1, ..., xn) {
  r1 = TARGET(x1, ..., xn); 
  y1 = adapt(A, x1, ..., xn);
  ...
  ym = adapt(A, x1, ..., xn);
  r2 = adapt(R, REF(y1, ..., ym));
  if (r1 == r2) printf("Match\n");
  else printf("Mismatch\n");
}

