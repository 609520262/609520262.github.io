
for i =1:4    % DispEn, SDE  输入为行向量  其他为列向量
    i
    data = logistics_data4{i}(10001:12048,1);
    %data = henon_datax(:,i);
    wgn30_data = awgn(data',30,'measured','dB');
%     AE_log(1,i) = ApproximateEntropy(wgn30_data,2,0.15);                             % AE
%     SE_log(1,i) = SampleEntropy(wgn30_data,2,0.15);                                  % SE
%     FE_log(1,i) = MultiscaleFuzzyEntropy_pdist_paran(wgn30_data,2,2,0.15,1);        % FE
%     PE_log(1,i) = MultiscalePermutationEntropy(wgn30_data,6,1,1);                   % PE
%     DivEn_log(1,i) = DEparameter(wgn30_data,4,1,30);                                 % DivEn
%     DistrEn_log(1,i) = DistEn(wgn30_data,2,1,512);                                   % DistEn
    DispEn_log(1,i) = MultiDispEn(wgn30_data,3,6,1,1);                               % DispEn
    SDE_log(1,i) = MultiscaleSymbolicDynamicEntropy(wgn30_data,3,12,1);              % SDE
    for j=1:41  
        j
        a = 30-j+1
        wgn_data = awgn(data',a,'measured','dB');
%         AE_wgn(j,i) = ApproximateEntropy(wgn_data, 2,0.15);                            % AE
%         SE_wgn(j,i) = SampleEntropy(wgn_data,2,0.15);                                 % SE
%         FE_wgn(j,i) = MultiscaleFuzzyEntropy_pdist_paran(wgn_data,2,2,0.15,1);       % FE
%         PE_wgn(j,i) = MultiscalePermutationEntropy(wgn_data,6,1,1);                  % PE
%         DivEn_wgn(j,i) = DEparameter(wgn_data,4,1,30);                                % DivEn
%         DistrEn_wgn(j,i) = DistEn(wgn_data,2,1,512);                                  % DistEn
        DispEn_wgn(j,i) = MultiDispEn(wgn_data,3,6,1,1);                              % DispEn
        SDE_wgn(j,i) = MultiscaleSymbolicDynamicEntropy(wgn_data,3,12,1);             % SDE
    end
end

% I_AE=abs(AE_wgn-AE_log)./AE_log;
% I_SE=abs(SE_wgn-SE_log)./SE_log;
% I_FE=abs(FE_wgn-FE_log)./FE_log;
% I_PE=abs(PE_wgn-PE_log)./PE_log;
% I_DivEn=abs(DivEn_wgn-DivEn_log)./DivEn_log;
% I_DistrEn=abs(DistrEn_wgn-DistrEn_log)./DistrEn_log;
I_DispEn=abs(DispEn_wgn-DispEn_log)./DispEn_log;
I_SDE=abs(SDE_wgn-SDE_log)./SDE_log;


x=0:40;
figure(1)
hold on
line(x,I_SE(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_SE(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_SE(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_SE(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('SE')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(2)
hold on
line(x,I_FE(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_FE(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_FE(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_FE(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('FE')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(3)
hold on
line(x,I_PE(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_PE(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_PE(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_PE(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('PE')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(4)
hold on
line(x,I_DivEn(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_DivEn(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_DivEn(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_DivEn(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('DivEn')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(5)
hold on
line(x,I_DistrEn(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_DistrEn(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_DistrEn(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_DistrEn(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('DistEn')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(6)
hold on
line(x,I_DispEn(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_DispEn(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_DispEn(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_DispEn(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('DispEn')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(7)
hold on
line(x,I_SDE(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_SDE(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_SDE(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_SDE(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('SDE')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

figure(8)
hold on
line(x,I_AE(:,1),'color','#8134af', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'o', 'MarkerSize', 6)
line(x,I_AE(:,2),'color','#dd2a7b', 'LineStyle', '-','LineWidth', 1.25, 'Marker', '^', 'MarkerSize', 6)
line(x,I_AE(:,3),'color','#515bd4', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'v', 'MarkerSize', 6)
line(x,I_AE(:,4),'color','#feda77', 'LineStyle', '-','LineWidth', 1.25, 'Marker', 'd', 'MarkerSize', 6)
title('AE')
xlabel('SNR') 
ylabel('S')
legend('r=3.7','r=3.8','r=3.9','r=4.0');

