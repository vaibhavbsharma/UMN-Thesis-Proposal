y_1_type:reg8_t == 1:reg8_t ? y_1_val:reg64_t : 
  ( y_1_val:reg64_t == 0:reg64_t ? x1:reg64_t : 
    ( y_1_val:reg64_t == 1:reg64_t ? x2:reg64_t : x3:reg64_t ))
