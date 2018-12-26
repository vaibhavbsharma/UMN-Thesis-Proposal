y_1_type:reg8_t == 1:reg8_t ? y_1_val:reg32_t : 
 ( y_1_type:reg8_t == 0:reg32_t ? 
   ( y_1_val:reg32_t == 0:reg32_t ? x1:reg32_t : 
    ( y_1_val:reg32_t == 1:reg32_t ? x2:reg32_t : x3:reg32_t )) 
  : 
   cast( cast( 
     ( y_1_val:reg32_t == 0:reg32_t ? x1:reg32_t : 
      ( y_1_val:reg32_t == 1:reg32_t ? x2:reg32_t : x3:reg32_t )) 
     L:reg16_t ) S:reg32_t )
