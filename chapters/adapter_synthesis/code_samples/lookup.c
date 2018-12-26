unsigned char lookup1
    (unsigned char *table, int key) { 
  if(abs(key) > 127) //buggy for key = -2147483648
    return -1;  
  return table[key+127];
}

unsigned char lookup2
    (unsigned char *table, int len, int key) { 
  if( !(-(len/2) <= key && key <= (len/2)) ) 
    return -1;
  return table[key+(len/2)];
}

unsigned char adapted_lookup2
    (unsigned char *table, int key) {
  return lookup2 (table, 255, key);
}
