
load('JULY_14_NOV_15_HH1.mat');

%% Finding average value for 1 day for the fullperiod
b=datestr(JUL_14_NOV_15_HH(:,1),'MM/hh/dd/mm/yy');
[ad,~,cd]=unique(b(:,1:5),'rows');
d=datenum(ad,'MM/hh');
CH4_DY = [d,accumarray(cd,JUL_14_NOV_15_HH(:,2),[],@nanmean)];
H2O_DY = [d,accumarray(cd,JUL_14_NOV_15_HH(:,3),[],@nanmean)];
CO2_DY = [d,accumarray(cd,JUL_14_NOV_15_HH(:,4),[],@nanmean)];
test1=datestr(CO2_DY(:,1));
%% Finding average value for 1 day for the JJAS time
date_i=datenum(2014,07,11);
date_e=datenum(2014,09,30);
%jas_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
%{
%% Plotting
figure(1)
plot(CH4_DY(:,1),CH4_DY(:,2));
xlabel('Hour (hh)') % x-axis label
ylabel('CH4 in ppm') % left y-axis label
title('Diurnal variation of CH4');
datetick('x','hh');
        saveas(gcf,'ch4_diurnal1.jpg');

figure(2)
plot(CO2_DY(:,1),CO2_DY(:,2));
datetick('x','hh');
xlabel('Hour (hh)') % x-axis label
ylabel('CO2 in ppm') % left y-axis label
title('Diurnal variation of CO2');
        saveas(gcf,'co2_diurnal.jpg');

figure(03)
plot(H2O_DY(:,1),H2O_DY(:,2));
datetick('x','hh');
xlabel('Hour (hh)') % x-axis label
ylabel('h20 in ppm') % left y-axis label
title('Diurnal variation of H2O');
        saveas(gcf,'h2o_diurnal.jpg');
%}
%% Seasonwise bifurcation
mon=datevec(JUL_14_NOV_15_HH(:,1));
jjas_intex=find(mon(:,2)>=6 & mon(:,2)<=9);
on_intex=find(mon(:,2)>=10 & mon(:,2)<=11);
djf_intex=find(mon(:,2)>=12 | mon(:,2)<=2);
mam_intex=find(mon(:,2)>=3 & mon(:,2)<=5);
jjas=JUL_14_NOV_15_HH(jjas_intex,:);
on=JUL_14_NOV_15_HH(on_intex,:);
djf=JUL_14_NOV_15_HH(djf_intex,:);
mam=JUL_14_NOV_15_HH(mam_intex,:);

%% Diurnal Values
addpath(genpath('/home/user/CARBON_INITIAL_WORK/DATA/FUNCTIONS'));

ch4_diurnal_jas=diurnal(jjas(:,1:2));
ch4_diurnal_on=diurnal(on(:,1:2));
ch4_diurnal_djf=diurnal(djf(:,1:2));
ch4_diurnal_mam=diurnal(mam(:,1:2));

co2_diurnal_jas=diurnal([jjas(:,1) jjas(:,4)]);
co2_diurnal_on=diurnal([on(:,1) on(:,4)]);
co2_diurnal_djf=diurnal([djf(:,1) djf(:,4)]);
co2_diurnal_mam=diurnal([mam(:,1) mam(:,4)]);



%% Seasonwise plotting
    %%% JJAS
figure(01)
set(gcf, 'Position', [10, 10, 1400, 900]);

subplot(2,2,1)
%jas_ch4_avg=nanmean(jjas(:,2));
[hAx,hLine1,hLine2]=plotyy(ch4_diurnal_jas(:,1),ch4_diurnal_jas(:,2),co2_diurnal_jas(:,1),co2_diurnal_jas(:,2));
datetick(hAx(1),'x','hh','keepticks');
datetick(hAx(2),'x','hh','keepticks');
    hLine1.LineStyle = '-';
            hLine2.LineStyle = '--';
                %xlabel('month') % x-axis label
                %set(hAx(2),'ytick',[]);
                ylabel(hAx(1),'CH4 in ppm') % left y-axis label
                %set(gca,'xlim',[00 24]);
                %set(gca,'xtick',(00:2:24));
                %ylabel(hAx(2),'CO2') % right y-axis label     
                %xticks ([Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec])
                set(hLine1,'Marker','.','MarkerSize',10)
                set(hLine2,'Marker','o','MarkerSize',5)  
                dim = [0.15 0.5 0.3 0.386];
                str = {'(a)'};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                legend('y = CH4','y = CO2','Location','southwest');
                title ('Monsoon');
%%%
subplot(2,2,2)
on_ch4_avg=nanmean(on(:,2));
[hAx,hLine1,hLine2]=plotyy(ch4_diurnal_on(:,1),ch4_diurnal_on(:,2),co2_diurnal_on(:,1),co2_diurnal_on(:,2));
datetick(hAx(1),'x','hh','keepticks');
datetick(hAx(2),'x','hh','keepticks');
hLine1.LineStyle = '-';
            hLine2.LineStyle = '--';
                %xlabel('month') % x-axis label
                %set(hAx(2),'ylim',[385 400]);
                %set(hAx(2),'ytick',(385:5:400));
                %ylabel(hAx(1),'CH4 in ppm') % left y-axis label
                ylabel(hAx(2),'CO2 in ppm') % right y-axis label     
                %xticks ([Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec])
                set(hLine1,'Marker','.','MarkerSize',10)
                set(hLine2,'Marker','o','MarkerSize',5)  
                dim = [0.6 0.5 0.3 0.386];
                str = {'(b)'};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                %legend('y = CH4','y = CO2','Location','southwest');
                title('Post Monsoon');
subplot(2,2,3)
djf_ch4_avg=nanmean(djf(:,2));
[hAx,hLine1,hLine2]=plotyy(ch4_diurnal_djf(:,1),ch4_diurnal_djf(:,2),co2_diurnal_djf(:,1),co2_diurnal_djf(:,2));
datetick(hAx(1),'x','hh','keepticks');
datetick(hAx(2),'x','hh','keepticks');
hLine1.LineStyle = '-';
            hLine2.LineStyle = '--';
                xlabel('hour') % x-axis label
                
                %set (hAx(2),'ytick',[]);
                %ylabel(hAx(1),'CH4 in ppm') % left y-axis label
                %ylabel(hAx(2),'CO2 in ppm') % right y-axis label     
                %xticks ([Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec])
                set(hLine1,'Marker','.','MarkerSize',10)
                set(hLine2,'Marker','o','MarkerSize',5)  
                dim = [0.15 0.045 0.3 0.386];
                str = {'(c)'};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                %legend('y = CH4','y = CO2','Location','southwest');
                title ('Winter');
subplot(2,2,4)
mam_ch4_avg=nanmean(mam(:,2));
[hAx,hLine1,hLine2]=plotyy(ch4_diurnal_mam(:,1),ch4_diurnal_mam(:,2),co2_diurnal_mam(:,1),co2_diurnal_mam(:,2));
datetick(hAx(1),'x','hh','keepticks');
datetick(hAx(2),'x','hh','keepticks');
hLine1.LineStyle = '-';
            hLine2.LineStyle = '--';
                xlabel('hour') % x-axis label
                %ylabel(hAx(1),'CH4 in ppm') % left y-axis label
                %ylabel(hAx(2),'CO2 in ppm') % right y-axis label     
                %xticks ([Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec])
                set(hLine1,'Marker','.','MarkerSize',10)
                set(hLine2,'Marker','o','MarkerSize',5)  
                dim = [0.6 0.045 0.3 0.386];
                str = {'(d)'};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                %legend('y = CH4','y = CO2','Location','southwest');
                title('Pre Monsoon');
            saveas(gcf,'CO2_CH4_DIURNAL_VAR.jpg');
%{           
%% For Co2
figure(5)
subplot(2,2,1)
b_jjas=datestr(jjas(:,1),'MM/hh/dd/mm/yy');
[ad_jjas,~,cd_jjas]=unique(b_jjas(:,1:5),'rows');
d_jjas=datenum(ad_jjas,'MM/hh');
CO2_DY_JJAS = [d_jjas,accumarray(cd_jjas,jjas(:,4),[],@nanmean)];
plot(CO2_DY_JJAS(:,1),CO2_DY_JJAS(:,2));
ylabel('CO2 in ppm') % left y-axis label
        title('Diurnal variation of CO2 for JAS');
datetick('x','hh');

%%%
subplot(2,2,2)
b_on=datestr(on(:,1),'MM/hh/dd/mm/yy');
[ad_on,~,cd_on]=unique(b_on(:,1:5),'rows');
d_on=datenum(ad_on,'MM/hh');
CO2_DY_ON = [d_on,accumarray(cd_on,on(:,4),[],@nanmean)];
plot(CO2_DY_ON(:,1),CO2_DY_ON(:,2));
        title('For ON');
datetick('x','hh');

subplot(2,2,3)
b_djf=datestr(djf(:,1),'MM/hh/dd/mm/yy');
[ad_djf,~,cd_djf]=unique(b_djf(:,1:5),'rows');
d_djf=datenum(ad_djf,'MM/hh');
CO2_DY_DJF = [d_djf,accumarray(cd_djf,djf(:,4),[],@nanmean)];
plot(CO2_DY_DJF(:,1),CO2_DY_DJF(:,2));
    xlabel('Hour (hh)') % x-axis label
        title('For DJF');
datetick('x','hh');

subplot(2,2,4)
b_mam=datestr(mam(:,1),'MM/hh/dd/mm/yy');
[ad_mam,~,cd_mam]=unique(b_mam(:,1:5),'rows');
d_mam=datenum(ad_mam,'MM/hh');
CO2_DY_MAM = [d_mam,accumarray(cd_mam,mam(:,4),[],@nanmean)];
plot(CO2_DY_MAM(:,1),CO2_DY_MAM(:,2));
        title('For MAM');
datetick('x','hh');
        saveas(gcf,'co2_diurnal_seasonwise.jpg'); 
%}
        %{
%% For H2O
figure(6)
subplot(2,2,1)
b_jjas=datestr(jjas(:,1),'MM/hh/dd/mm/yy');
[ad_jjas,~,cd_jjas]=unique(b_jjas(:,1:5),'rows');
d_jjas=datenum(ad_jjas,'MM/hh');
H2O_DY_JJAS = [d_jjas,accumarray(cd_jjas,jjas(:,3),[],@nanmean)];
plot(H2O_DY_JJAS(:,1),H2O_DY_JJAS(:,2));
ylabel('H2O in ppm') % left y-axis label
        title('Diurnal variation of H2O for JAS');
datetick('x','hh');

%%%
subplot(2,2,2)
b_on=datestr(on(:,1),'MM/hh/dd/mm/yy');
[ad_on,~,cd_on]=unique(b_on(:,1:5),'rows');
d_on=datenum(ad_on,'MM/hh');
H2O_DY_ON = [d_on,accumarray(cd_on,on(:,3),[],@nanmean)];
plot(H2O_DY_ON(:,1),H2O_DY_ON(:,2));
        title('For ON');
datetick('x','hh');

subplot(2,2,3)
b_djf=datestr(djf(:,1),'MM/hh/dd/mm/yy');
[ad_djf,~,cd_djf]=unique(b_djf(:,1:5),'rows');
d_djf=datenum(ad_djf,'MM/hh');
H2O_DY_DJF = [d_djf,accumarray(cd_djf,djf(:,3),[],@nanmean)];
plot(H2O_DY_DJF(:,1),H2O_DY_DJF(:,2));
    xlabel('Hour (hh)') % x-axis label
        title('For DJF');
datetick('x','hh'); 

subplot(2,2,4)
b_mam=datestr(mam(:,1),'MM/hh/dd/mm/yy');
[ad_mam,~,cd_mam]=unique(b_mam(:,1:5),'rows');
d_mam=datenum(ad_mam,'MM/hh');
H2O_DY_MAM = [d_mam,accumarray(cd_mam,mam(:,3),[],@nanmean)];
plot(H2O_DY_MAM(:,1),H2O_DY_MAM(:,2));
        title('For MAM');
datetick('x','hh');
        saveas(gcf,'h2o_diurnal_seasonwise.jpg'); 
        %}