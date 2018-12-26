int f1(std::string s1, std::string s2) {
  return s1==s2; // compare string objects
}

int f2(std::string s1, std::string s2) {
  return s1.compare(s2); // similar to strcmp
}

int adapted_returnval_f2(std::string s1, std::string s2) {
  return f2(s1,s2)==0;
}
