clc;clear all;close all;
%% load data and cut into slices
% load N205
% Data=N205;
% Fs=10240;%sample frequency
%_____________________________
load jointdata2
Data=jointtrain([2,4,5,7,9],:);%,11
Fs=64000;%sample frequency
%______________________________
[p,q]=size(Data);%3*XX
partlength=2048;% slices length
steplength=512;% overlapping step
MSE=[];%Applying for Storage Space
% >>>>>>>>>>>>>>>>>>>>>paremeter of method<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
% scale=14;
% m=2;
% n=3;
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% calculate multiscale entropy
for i=1:p
    for j=1:steplength:99*steplength+2 % cut 100 sample,2048 points per sample
    
    %+++++++++++++++++++++++++++++++++++++++++ change entropy method++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %<<<<<<<<<<<<<<<<<<<<<<< MultiscaleFuzzyEntropy >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     r=0.15; scale=14;m=2;n=2;
%     [MSEj]=MultiscaleFuzzyEntropy_pdist_paran(Data(i,j:j+partlength),m,n,r,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiscalePermutationEntropy >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m= 4;t=1;scale=14;
%     [MSEj]=MultiscalePermutationEntropy(Data(i,j:j+partlength),m,t,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiscaleSymbolicDynamicEntropy >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m= 3;scale=14;sigma=12;
%     [MSEj]=MultiscaleSymbolicDynamicEntropy(Data(i,j:j+partlength),m,sigma,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiDispEn >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m= 3;t=1;scale=14;nc=6;
%     [MSEj]=MultiDispEn(Data(i,j:j+partlength),m,nc,t,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiDistEn >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m= 2;tau=1;scale=14;M=512;
%     [MSEj]=MultiDistEn(Data(i,j:j+partlength),m,tau,M,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiDivEn >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m= 4;tau=1;scale=14;sigma=30;
%     [MSEj]=MultiDivEn(Data(i,j:j+partlength),m,tau,sigma,scale)
    %<<<<<<<<<<<<<<<<<<<<<<< MultiApEn >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    m=2;  r=0.15;scale=14;
    [MSEj]=MultiApEn(Data(i,j:j+partlength),m,r,scale);

    %<<<<<<<<<<<<<<<<<<<<<<< MultiSampleEntropy >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     m=2;  r=0.15;scale=14;
%     [MSEj]=MultiSampleEntropy(Data(i,j:j+partlength),m,r,scale)
    %+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    MSE=[MSE;MSEj];
    end
end
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% generate label
partnumber=size(MSE,1)/p;%500/p
label=[];
for i=1:p
    for j=1:partnumber
    label((i-1)*partnumber+j)=i;
    end
end
label=label';
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 2D-visualization plot
figure
rng default % for reproducibility(:,1:7)(:,1:15)
Y = tsne(MSE(:,1:14));%(:,1:15)
color = lines(12); % Generate color values
gscatter(Y(:,1),Y(:,2),label,color(5:12,:),'o+*vh',[3 3 3 3 3])
set(gcf,'unit','centimeters','position',[10 5 8 6])
xlabel('ApEn');ylabel('ApEn');
title('MultiscaleApEn');
set(gca,'linewidth',0.75,'fontsize',7,'fontname','Times New Roman');%'xtick',[],
legend
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% RESULT saving
save(['D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\Multiscale_code\result\','MultiscaleApEn','.mat'],'MSE','label')
% save MSSE_ADP_21126ExpSNR MSE label %train.mat single
cd='D:\Program Files\Polyspace\R2020b\bin\0装备智能运维实验室\20221213 熵值网站构建\Multiscale_code\result\';
savefigure(cd,'MultiscaleApEn')
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% subprogram

