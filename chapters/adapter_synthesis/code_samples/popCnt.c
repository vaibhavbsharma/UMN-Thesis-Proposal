unsigned short popCntNaive(unsigned short v) {
  unsigned short c;
  for (c = 0; v; v >>= 1) { c += v & 1; }
  return c;
}
unsigned short popCntSketch(unsigned short x) {
  x= (x & 0x5555)+ ((x>> 1) & 0x5555); 
  x= (x & 0x3333)+ ((x>> 2) & 0x3333); 
  x= (x & 0x0077)+ ((x>> 8) & 0x0077); 
  x= (x & 0xf)+ ((x>> 4) & 0xf); 
  return x;
}
