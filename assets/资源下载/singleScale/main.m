%% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>experiment data generation
clear all;clc;close all;
load N205  %unit: m/s^2
% load('logistics4_3.7_3.8_3.9_4.0.mat')
%#########################################################################
% signal synthesis
Fs=10240;
noise=(awgn(ones(1,2048*4),5,'measured','dB')-1)*20;
raw_signal1=[noise,N205(1,1:2048*4),noise,N205(2,1:2048*4),noise,N205(3,1:2048*4),noise];
% plot
figure;
L=53248;
t=1/Fs:1/Fs:L/Fs;
plot(t(1:L),raw_signal1(1:L),'k')
 xlim([0 5.2])
 ylabel('Amp (g)');
 xlabel('Times (s)');
set(gca,'fontname','times new Roman','fontsize',7.5);
    set(gcf,'unit','centimeters','position',[10 5 8 6])
%**************************************************************************************
%**************************************************************************************
%#########################################################################
%% >>>>>>>>>>>>>>>>>>>>>>>>>>Approximate entropy methods>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% partitioning dataset
% __________________________Approximate entropy____________________________
%m is usually 2, and r is usually (0.1 to 0.25)SD(x), 
%where SD(x) represents the standard deviation of the signal sequence
slidwide=512;
maxN=(L-2048)/slidwide;
k=1;        m= 2;r= 0.15;
for i=1:maxN  % datapoint circulate
        s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
        sei=ApproximateEntropy(s,m,r);
        if (isnan(sei) || isinf(sei)) ==1  % replace nan by 1
            se(k)=1
            k=k+1;
        end
end
for i=2:length(se)  % datapoint circulate
        SE(i-1)=se(i)-se(1);
end
SE=abs(SE);
% plot 
figure;
L=size(SE,2);
t=1:size(SE,2);
plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[59,139,161]/255)
%  xlim([0 2.6])
set(gca,'xtick',[]);
set(gca,'fontname','times new Roman','fontsize',7.5);
ylabel('AD value','fontsize',6.5);
xlabel('Sliding window numbers');
title('ApEn-based impulse detection');
set(gcf,'unit','centimeters','position',[10 5 8 6])
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\ApEn';
% introduction='ApEn'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Sample entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 2;r= 0.15;
% %         se(i,j)=SShannonE(s,interval,sigma);
%         sei=SampleEntropy(s,m,r);
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[255,165,16]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('SE-based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6])
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\SE';
% introduction='SE'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Fuzzy entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% close all;
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 2;r= 0.15;n=2;scale=1;
%           sei=  FuzzyEntropy(s,m,n,r)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[12,132,198]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('FE-based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6])
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\FE';
% introduction='FE'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Permutation entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% close all;
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 6;t=1;scale=1;
%         sei = PermutationEntropy(s,m,t)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[255,189,102]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('PE-based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6])
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\PE';
% introduction='PE'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Diversity entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% close all;
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 4;t=2;scale=1;sigma=30;
% %         se(i,j)=SShannonE(s,interval,sigma);
%         sei=DEparameter(s,m,t,sigma)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[255,181,186]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('Diversity entropy based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6]);
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\Diversity entropy';
% introduction='Diversity entropy'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Symbolic Dynamic entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% % close all;
% % figure
% raw_signal1=logistics_data4{1,1}';
% L=length(raw_signal1);
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         s=awgn(s,30,'measured','dB')
%         m= 3;scale=1;sigma=12;
% %         se(i,j)=SShannonE(s,interval,sigma);
%         sei=SymbolDynamicEntropy(s,m,sigma)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[220,91,33]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('SDE based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 20 8]);
% save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\SDE';
% introduction='SDE'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>Dist entropy methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% close all;
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 2;t=1;scale=1;M=512;
% %         se(i,j)=SShannonE(s,interval,sigma);
%         sei=DistEn(s,m,t,M)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[186,221,214]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('DistEn based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6]);
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\DistEn';
% introduction='DistEn'
% savefigure(cd,introduction )
%**************************************************************************************
%**************************************************************************************
%% >>>>>>>>>>>>>>>>>>>>>DispEn methods>>>>>>>>>>>>>>>>>>>>>>>
%**************************************************************************************
%**************************************************************************************
% close all;
% slidwide=512;
% maxN=(L-2048)/slidwide;
% k=1;
% for i=1:maxN  % datapoint circulate
%         s=raw_signal1((1+slidwide*(i-1)):(1+slidwide*(i-1)+2047));
%         m= 3;t=1;scale=1;nc=6;
% %         se(i,j)=SShannonE(s,interval,sigma);
%         sei=MultiDispEn(s,m,nc,t,scale)
%         if (isnan(sei) || isinf(sei)) ==0
%             se(k)=sei
%             k=k+1;
%         end
% end
% for i=2:length(se)  % datapoint circulate
%         SE(i-1)=se(i)-se(1);
% end
% SE=abs(SE);
% % plot 
% figure;
% L=size(SE,2);
% t=1:size(SE,2);
% plot(t(1:L),SE(:),'-D','MarkerSize',5,'linewidth',1.5,'Color',[228,219,191]/255)
% %  xlim([0 2.6])
% set(gca,'xtick',[]);
% set(gca,'fontname','times new Roman','fontsize',7.5);
% ylabel('AD value','fontsize',6.5);
% xlabel('Sliding window numbers');
% title('DispEn based impulse detection');
% set(gcf,'unit','centimeters','position',[10 5 8 6]);
% % save
% cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\result\DispEn';
% introduction='DispEn'
% savefigure(cd,introduction )
% 





























