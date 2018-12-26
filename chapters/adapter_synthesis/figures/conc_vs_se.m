x = [
%9350	%	isupper <- islower
%9350	%	islower <- isupper
468	%	abs <- labs
468	%	abs <- llabs
390	%	labs <- llabs
390	%	llabs <- labs
7372	%	ldiv <- lldiv
7372	%	lldiv <- ldiv
660	%	ffs <- ffsl
660	%	ffs <- ffsll
390	%	ffsl <- ffsll
390	%	ffsll <- ffsl
5472	%	setpgrp <- setpgid
99360	%	wait <- waitpid
1492992	%	wait <- wait4
99360	%	wait <- wait3
2534976	%	waitpid <- wait4
2534976	%	wait3 <- wait4
6384	%	umount <- umount2
390	%	putchar <- putchar_unlocked
390	%	putchar_unlocked <- putchar
390	%	putwchar <- putwchar_unlocked
390	%	putwchar_unlocked <- putwchar
35680256	%	recv <- recvfrom
35680256	%	send <- sendto
390	%	atol <- atoll
390	%	atoll <- atol
99360	%	atol <- strtol
99360	%	atoi <- strtol
99360	%	atoll <- strtoll
8673025	%	killpg <- kill (0,16)
19600 %	killpg <- kill (0,1)
%4695415	%	rc4enc_m <- rc4enc_o
%4562354	%	rc4enc_o <- rc4enc_m
%421823808	%	rc4setup_o <- rc4setup_m
%421823808	%	rc4setup_m <- rc4setup_o
%399126	%	naive_mm <- Strassen_mm
%667	%	crc32 <- obfs_crc32
%6216	%	security case study fns
];


conc_as = [ 
%1	%	isupper <- islower	
%0.6	%	islower <- isupper	
1.447	%	abs <- labs	
1.325	%	abs <- llabs	
0.948	%	labs <- llabs	
1.338	%	llabs <- labs	
10.55	%	ldiv <- lldiv	
7.574	%	lldiv <- ldiv	
0.295	%	ffs <- ffsl	
0.286	%	ffs <- ffsll	
0.465	%	ffsl <- ffsll	
0.495	%	ffsll <- ffsl	
0.779	%	setpgrp <- setpgid	
17.84	%	wait <- waitpid	
345.312	%	wait <- wait4	
13.514	%	wait <- wait3	
469.871	%	waitpid <- wait4	
529.684	%	wait3 <- wait4	
0.791	%	umount <- umount2	
0.587	%	putchar <- putchar_unlocked	
0.675	%	putchar_unlocked <- putchar	
0.376	%	putwchar <- putwchar_unlocked	
0.829	%	putwchar_unlocked <- putwchar	
7111	%	recv <- recvfrom	
2821	%	send <- sendto	
0.713	%	atol <- atoll	
0.334	%	atoll <- atol	
29	%	atol <- strtol	
15	%	atoi <- strtol	
23	%	atoll <- strtoll	
1918.6	%	killpg <- kill (0,16)	
3.4	%	killpg <- kill (0,1)	
%364	%	rc4enc_m <- rc4enc_o	
%92	%	rc4enc_o <- rc4enc_m	
%25083	%	rc4setup_o <- rc4setup_m	
%29422	%	rc4setup_m <- rc4setup_o	
%183	%	naive_mm <- Strassen_mm	
%0.1	%	crc32 <- obfs_crc32	
%2	%	security case study fns	
];

se_as = [
%70	%	isupper <- islower
%57	%	islower <- isupper
1.145	%	abs <- labs
1.147	%	abs <- llabs
0.41	%	labs <- llabs
0.407	%	llabs <- labs
6	%	ldiv <- lldiv
5	%	lldiv <- ldiv
7.905	%	ffs <- ffsl
8	%	ffs <- ffsll
2.617	%	ffsl <- ffsll
2.634	%	ffsll <- ffsl
0.41	%	setpgrp <- setpgid
0.43	%	wait <- waitpid
0.435	%	wait <- wait4
0.435	%	wait <- wait3
1.044	%	waitpid <- wait4
1.026	%	wait3 <- wait4
0.437	%	umount <- umount2
0.458	%	putchar <- putchar_unlocked
0.462	%	putchar_unlocked <- putchar
0.423	%	putwchar <- putwchar_unlocked
0.419	%	putwchar_unlocked <- putwchar
9	%	recv <- recvfrom
8	%	send <- sendto
0.396	%	atol <- atoll
0.378	%	atoll <- atol
4.91	%	atol <- strtol
4.42	%	atoi <- strtol
4.15	%	atoll <- strtoll
3.03	%	killpg <- kill (0,16)
3	%	killpg <- kill (0,1)
%13715	%	rc4enc_m <- rc4enc_o
%11053	%	rc4enc_o <- rc4enc_m
%1641	%	rc4setup_o <- rc4setup_m
%2049	%	rc4setup_m <- rc4setup_o
%310	%	naive_mm <- Strassen_mm
%4	%	crc32 <- obfs_crc32
%36	%	security case study fns
]; 

% x=1:size(se_as,2);

%hold on; 
figure
loglog(x,se_as,'ro','Linewidth',2);
hold on;
loglog(x,conc_as,'bx','Linewidth',2);
hold on;

Const = polyfit(log(x),log(conc_as), 1);
m = Const(1);
k = Const(2);
YBL = x.^m.*exp(k);
loglog(x,YBL)
hold on; 

Const = polyfit(log(x),log(se_as), 1);
m = Const(1);
k = Const(2);
YBL = x.^m.*exp(k);
loglog(x,YBL)
hold on; 




set(gca,'FontSize',15);
xlabel('Size of Adapter Search Space');
ylabel('Seconds');
h_legend=legend('Symbolic Execution','Concrete Enumeration');
% ylim([0 42]);

toplot_legend_best('Size of Adapter Search Space','Seconds','',h_legend);

%hold off;
print -dpdf './conc_vs_se'
