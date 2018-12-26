int BN_hex2bn(BIGNUM **bn, const char *a)
{
	BIGNUM *ret = NULL;
	int i;
	...
	for (i = 0; isxdigit((unsigned char)a[i]); i++)
        continue;
	...	
    if (bn_expand(ret, i*4) == NULL) // i*4 overflows
        goto err;
	...
}
