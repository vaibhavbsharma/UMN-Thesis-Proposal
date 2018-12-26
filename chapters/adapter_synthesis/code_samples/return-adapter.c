int f1(int i) {
  return (isdigit(i)!=0 || isalpha(i)!=0);
}

int f2(int i) {
  return isalnum(i);
}

int adapted_returnvalue_f2(int i) {
  return f2(i)!=0;
}
