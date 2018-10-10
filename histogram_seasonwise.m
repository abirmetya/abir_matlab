load('DAY_14_15.mat');
load('NIGHT_14_15.mat');
%% Plot
figure(1)
    %%% For J A S time
subplot(3,2,1)
    date_i=datenum(2014,07,11);
date_e=datenum(2014,09,30);
jas_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
jas_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

jas_day=DAY_14_15(jas_day_intex,:); 
jas_night=NIGHT_14_15(jas_night_intex,:);

a1=histogram(jas_day(:,3),20,'normalization','probability');
hold on;
a2=histogram(jas_night(:,3),20,'normalization','probability');
%xlabel('H2O Concentration (ppm)') % x-axis label
%ylabel('PDF') % right y-axis label
legend('y = H2O DAY','y = H2O NIGHT','Location','northeast');
title('PDF of H2O concentration day and night in JAS 2014')

subplot(3,2,2)
date_i=datenum(2014,10,01);
date_e=datenum(2014,12,31);
ond_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
ond_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

ond_day=DAY_14_15(ond_day_intex,:); 
ond_night=NIGHT_14_15(ond_night_intex,:);

a3=histogram(ond_day(:,3),20,'normalization','probability');
hold on;
a4=histogram(ond_night(:,3),20,'normalization','probability');
%xlabel('H2O Concentration (ppm)') % x-axis label
%ylabel('PDF') % right y-axis label
%legend('y = H2O DAY','y = H2O NIGHT','Location','northeast');
title('OCT NOV DEC 2014')

subplot(3,2,3)

date_i=datenum(2015,01,01);
date_e=datenum(2015,03,31);
jfm_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
jfm_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

jfm_day=DAY_14_15(jfm_day_intex,:); 
jfm_night=NIGHT_14_15(jfm_night_intex,:);

a5=histogram(jfm_day(:,3),20,'normalization','probability');
hold on;
a6=histogram(jfm_night(:,3),20,'normalization','probability');
%xlabel('H2O Concentration (ppm)') % x-axis label
ylabel('PDF') % right y-axis label
%legend('y = H2O DAY','y = H2O NIGHT','Location','northeast');
title('JAN FEB MAR 2015')

subplot(3,2,4)

date_i=datenum(2015,04,01);
date_e=datenum(2015,06,30);
amj_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
amj_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

amj_day=DAY_14_15(amj_day_intex,:); 
amj_night=NIGHT_14_15(amj_night_intex,:);

a7=histogram(amj_day(:,3),20,'normalization','probability');
hold on;
a8=histogram(amj_night(:,3),20,'normalization','probability');
%xlabel('H2O Concentration (ppm)') % x-axis label
ylabel('PDF') % right y-axis label
%legend('y = H2O DAY','y = H2O NIGHT','Location','northeast');
title('APR MAY JUN 2015')

subplot(3,2,5)
date_i=datenum(2015,07,01);
date_e=datenum(2015,09,31);
jas_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
jas_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

jas_day=DAY_14_15(jas_day_intex,:); 
jas_night=NIGHT_14_15(jas_night_intex,:);

a9=histogram(jas_day(:,3),20,'normalization','probability');
hold on;
a10=histogram(jas_night(:,3),20,'normalization','probability');
%xlabel('H2O Concentration (ppm)') % x-axis label
%ylabel('PDF') % right y-axis label
%legend('y = H2O DAY','y = H2O NIGHT','Location','northeast');
title('JUL AUG SEP 2015')

subplot(3,2,6)
date_i=datenum(2015,10,01);
date_e=datenum(2015,11,31);
on_day_intex=find(DAY_14_15(:,1)>= date_i & DAY_14_15(:,1) <= date_e);
on_night_intex=find(NIGHT_14_15(:,1)>= date_i & NIGHT_14_15(:,1) <= date_e);

on_day=DAY_14_15(on_day_intex,:); 
on_night=NIGHT_14_15(on_night_intex,:);

a11=histogram(on_day(:,3),20,'normalization','probability');
hold on;
a12=histogram(on_night(:,3),20,'normalization','probability');
xlabel('H2O Concentration (ppm)') % x-axis label
title('OCT NOV 2015')

saveas(gcf,'seasonwise_pdf_h20.jpg')
