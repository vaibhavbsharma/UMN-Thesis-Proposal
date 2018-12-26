// str_addr initialized by FuzzBALL 
char *str_addr;
long target_fn (BIGNUM *h) {
	BN_hex2bn(&h, str_addr);
	return 0;
}
long inner_fn (mbedtls_mpi *h, int radix) {
  mbedtls_mpi_read_string(h, radix, str_addr);
  return 0;
}
