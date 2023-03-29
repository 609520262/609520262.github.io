% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>simulation data generation
% 1.6211 bearings
d=14.288;%%滚动体直径
D=77.5;%节径
rpm=3000;%转速
z=10;%滚动体个数
Fn=2548;%轴承固有频率
Fs=20480;%采样频率
n=1.5;%滚子轴承 n =1.1， 对于球轴承 n =1.5。
% 2.
Fg=1000;%%%衰减函数
Fh=rpm/60;%转频
Fo=rpm/60 * 1/2 * z*(1-d/D);
Fi=rpm/60 * 1/2 * z*(1+d/D);
Fb=rpm/60 * 1/2 * D/d *(1-(d/D)^2); 

detaC=1/Fs;%两个脉冲之间的间隔，实际上就是公式4-1中的T
detaW=1/Fo;
detaN=1/Fi;
detaB=1/Fb;

t=0:detaC:10;%总时长1s  这个影响生成的信号总长度

%T=1/Fg;
T1=1/Fs;

GZ=sin(2*pi*Fn*t);
X=exp(-Fg*t);%衰减函数，对应公式4-2,4-3
%载荷分布
phi=2*pi*Fh*t;%这个就公式里那个载荷范围fai,fai=2.π.f.t
P=cos(phi);%投影函数p(fai)

Mq=1; %对应4-6里的那个qmax
epsilong=0.5;%载荷分布系数 应该是一个公式算出来的
Cd=0;%%%%径向游隙 应该是用来算epsilong的们这里好像没啥用

Q=Mq*power((1-((1/(2*epsilong))*(1-cos(phi)))),n);%载荷分布的公式4-6     power 是几次方的函数 

%3.外圈故障（ORF)
%冲击函数

G=length(t);
CJ=zeros(1,G);
BS=round(detaW/detaC);%外圈特征/采样频率，实际上就是在时间轴t上，多少个点产生一个冲击
TD=round(G/BS);%冲击有多少个
CJ(1)=1;
for i=2:TD
    CJ((i-1)*BS)=1;%单位脉冲冲击
end


% 卷积(外圈仿真)

WF=conv(CJ,X);%公式4-3 公式中的脉冲强度没有体现，可以理解为d=1
SimBearing(1,:)=real(WF(1:G).*GZ);%%%外圈
% k=1;
% for SNR=-36:12:24
% k=k+1;
%  SimBearing(1,:)=awgn(SimBearing(1,:),-18.626,'measured','dB'); 
SimBearing(1,:)=awgn(SimBearing(1,:),5,'measured','dB')
%   SimBearing(5,:)=awgn(SimBearing(1,:),-30,'measured','dB'); 
%  SimBearing(4,:)=awgn(SimBearing(1,:),-45,'measured','dB'); 
%  SimBearing(3,:)=awgn(SimBearing(1,:),-10,'measured','dB'); 
%  SimBearing(2,:)=awgn(SimBearing(1,:),0,'measured','dB'); 
%  SimBearing(1,:)=awgn(SimBearing(1,:),5,'measured','dB'); 
 
% figure
% plot(SimBearing(k,1:2000))
% end
%4.内圈故障（IRF)

% 冲击函数

G=length(t);
CJI=zeros(1,G);
BSI=round(detaN/detaC);
TDI=round(G/BSI);
CJI(1)=1;
for i=2:TDI
    CJI((i-1)*BSI)=1;%脉冲函数
end



% 内圈仿真

HHS=Q.*P.*CJI;%冲击=脉冲函数*载荷分布p（fai)*投影q（fai）

NF=conv(HHS,X);%公式4-12，那个转换系数Ai实际上没有体现

SimBearing(2,:)=real(NF(1:G).*GZ);%内圈
SimBearing(2,:)=awgn(SimBearing(2,:),5,'measured','dB'); 

%  SimBearing(2,:)=awgn(SimBearing(2,:),-27.91,'measured','dB'); 
%   SimBearing(2,:)=awgn(SimBearing(2,:),-10,'measured','dB'); 
%5.滚动体故障（BF)


% 外圈冲击
G=length(t);
CJBO=zeros(1,G);
BSB=round(detaB/detaC);
TDB=round(G/BSB);
CJBO(1)=1;
for i=2:TDB
    CJBO((i-1)*BSB)=1;%外圈与滚动体产生的单位脉冲
end

% 内圈冲击

CJBI=zeros(1,G);
BSB=round(detaB/detaC);
if mod(BSB,2)==0
else
    BSB=BSB+1;
end

TDB=round(G/BSB);

for i=1:TDB
    CJBI(((2*i-1)/2)*BSB)=1;%内圈与滚动体产生的单位脉冲
end

CJBZ=3*CJBO+CJBI;%滚动体故障的单位脉冲 式4-14，这里，假设外圈的脉冲是内圈脉冲的3倍（论文里没说是几倍，直说是大于）


% 滚珠仿真

HHSB=Q.*P.*CJBZ;
BF=conv(HHSB,X);


SimBearing(3,:)=real(BF(1:G).*GZ);%%%%球故障信号，应该是一个复数们，这里取实部
SimBearing(3,:)=awgn(SimBearing(3,:),5,'measured','dB'); 
% plot 
 for i=1:3
%      figure
subplot(3,1,i);
%       plot(SimBearing(i,1:2000));
      t=1/Fs:1/Fs:Fs/Fs;
      plot(t(1:2000),SimBearing(i,1:2000),'k')
      xlabel('Time (s)');ylabel('Amplitude (g)');
      set(gca,'fontname','times new Roman','fontsize',7.5);
      xlim([0 0.08])% set(gcf,'unit','centimeters','position',[10 5 10 9])
      set(gcf,'unit','centimeters','position',[10 5 8 7])
      
 end