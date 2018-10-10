%% ========================================================================
%   Load 10 Minutes and Hourly data
% ========================================================================
load('JULY_14_NOV_15_HH1.mat');
load('JULY_14_NOV_15_MM1.mat');

%% ========================================================================
%   Find daily average 
% =========================================================================
b        = datestr(JUL_14_NOV_15_HH(:,1),'yy/mm/dd/hh/MM');
[ad,~,cd]= unique(b(:,1:8),'rows');
d        = datenum(ad,'yy/mm/dd');
CH4_DY   = [d,accumarray(cd,JUL_14_NOV_15_HH(:,2),[],@nanmean)];
H2O_DY   = [d,accumarray(cd,JUL_14_NOV_15_HH(:,3),[],@nanmean)];
CO2_DY   = [d,accumarray(cd,JUL_14_NOV_15_HH(:,4),[],@nanmean)];
test1    = datestr(CH4_DY(:,1));

%% ========================================================================
%   Save Files
% =========================================================================
delete('CH4_DAILY.mat');
delete('CO2_DAILY.mat');
delete('H2O_DAILY.mat');
delete('CHO_DAILY.mat');

cho = [CH4_DY(:,1) CH4_DY(:,2) H2O_DY(:,2) CO2_DY(:,2)];
save('CHO_DAILY.mat','cho');
%save('CO2_DAILY.mat','CO2_DY');
%save('H2O_DAILY.mat','H2O_DY');

%% ========================================================================
% Compute running mean
% 5 day running mean
% =========================================================================
w_s         = 5;                            % Window
mov_avg_ch4 = tsmovavg(CH4_DY,'s',w_s,1);
mov_avg_co2 = tsmovavg(CO2_DY,'s',w_s,1);
mov_avg_h2o = tsmovavg(H2O_DY,'s',w_s,1);

%::::::::::::::::::::::::::: Statistics ::::::::::::::::::::::::::::::::::%

%% ========================================================================
%   Corelations
% =========================================================================
%:::::::::::::::::::::: 10 Minute Correlation ::::::::::::::::::::::::::::%
CO2_H2O_MIN_CORR = corrcoef(JUL_14_NOV_15_MM(:,4),JUL_14_NOV_15_MM(:,3));
CO2_CH4_MIN_CORR = corrcoef(JUL_14_NOV_15_MM(:,4),JUL_14_NOV_15_MM(:,2));
H2O_CH4_MIN_CORR = corrcoef(JUL_14_NOV_15_MM(:,3),JUL_14_NOV_15_MM(:,2));

%:::::::::::::::::::::::: Hourly Correlation :::::::::::::::::::::::::::::%
CO2_H2O_HR_CORR  = corrcoef(JUL_14_NOV_15_HH(:,4),JUL_14_NOV_15_HH(:,3));
CO2_CH4_HR_CORR  = corrcoef(JUL_14_NOV_15_HH(:,4),JUL_14_NOV_15_HH(:,2));
H2O_CH4_HR_CORR  = corrcoef(JUL_14_NOV_15_HH(:,3),JUL_14_NOV_15_HH(:,2));

%::::::::::::::::::::::::: Daily Correlation :::::::::::::::::::::::::::::%
CO2_H2O_DY_CORR=corrcoef(CO2_DY(:,2),H2O_DY(:,2));
CO2_CH4_DY_CORR=corrcoef(CO2_DY(:,2),CH4_DY(:,2));
H2O_CH4_DY_CORR=corrcoef(H2O_DY(:,2),CH4_DY(:,2));

%::::::::::::::::::::::::: 5 Days Correlation ::::::::::::::::::::::::::::%
CO2_H2O_5_CORR = corrcoef(mov_avg_co2(5:end,2),mov_avg_h2o(5:end,2));
CO2_CH4_5_CORR = corrcoef(mov_avg_co2(5:end,2),mov_avg_ch4(5:end,2));
H2O_CH4_5_CORR = corrcoef(mov_avg_h2o(5:end,2),mov_avg_ch4(5:end,2));

%::::::::::::::::::::::::::::::: Plotting ::::::::::::::::::::::::::::::::%      

%% ========================================================================
%    Timeseries of CO2 and CH4 (DAILY and MONTHLY)
% =========================================================================
figure(01);

    subplot (2,1,1);
        plot(d,CO2_DY(:,2),'o','MarkerFaceColor', 'b','MarkerSize',4);
        hold on;
        plot (mon_avg_co2(:,1),mon_avg_co2(:,2),'r+--','MarkerSize',12);
        
        datetick('x','mmm-yy','keepticks');
        %xlabel('Time (mmm)') % x-axis label
        ylabel('CO2 in ppm') %  y-axis label
            dim = [0.15 0.5 0.3 0.386];
            str = {'(a)'};
            annotation('textbox',dim,'String',str,'FitBoxToText','on');
        axis tight;
        %title('Time Series of CO2 on daily basis')    
        %saveas(gcf,'CO2_CH4_DY.jpg');

    subplot (2,1,2);
        plot(d,CH4_DY(:,2),'o','MarkerFaceColor','b','MarkerSize',4)
        hold on;
        plot (mon_avg_ch4(:,1),mon_avg_ch4(:,2),'r+--','MarkerSize',12);
        
        datetick('x','mmm-yy','keepticks');
        xlabel('Date (mmm-yy)') % x-axis label
        ylabel('CH4 in ppm') %  y-axis label
            dim = [0.15 0.02 0.3 0.386];
            str = {'(b)'};
            annotation('textbox',dim,'String',str,'FitBoxToText','on');
        axis tight;
        
        print(gcf,'CO2_CH4_DY.png','-dpng','-r400');   % Save in HD quality