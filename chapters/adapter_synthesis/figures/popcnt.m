x = [ 9 16 80 120 128 255 256 513 704 4050 6144 13108 14399 16383 21846 53248 64125 65535 263168 1012500 1727642 2096770 15946875 16776450];

conc_as = [ 0.229524 0.230383 0.461542 0.237168 0.246069 1.313591 0.243941 0.269752 1.053083 2.549051 3.758819 0.529406 7.229943 5.933827 1.500733 17.455551 25.135498 15.461317 119.813987 514.808455 856.905758 754.604434 3321.885708 6045.72323]; 

% x=1:size(se_as,2);
se_as = [  0.376622 0.374564 3.769673 0.381797 0.375335 2.80914 0.37684 0.376364 1.985466 5.523263 1.121787 0.375749 5.100947 5.160669 0.37659 4.603872 11.261711 5.255073 5.071954 4.588098 7.898593 7.935009 13.206089 7.918545];

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

print -dpdf '/Users/Vaibhav/git_repos/AdapterSynth-paper/figures/popcnt'
hold off;
