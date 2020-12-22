%{
    Lipo Battery Requirements calculator for a mini UAV
    Created by: Jacob Lawson
    Date: 02/12/2020
%}

% Input data
Nm = 3; % Number of Motors
ImM = 9.3; % Max Motor Current in Amps
Io = 2; % Estimated TotalOther Current in Amps
Nseries = 3; % Number of Battery Cells in Series
Vbatnom = Nseries * 3.7; % Total Nnominal Battery Voltage
Qcap = 0 : 50 : 2000; % Battery Capacity in mAh
DR = .80; % Battery Discharge Rule
Lfly = .30; % Standard Flying Load

% Battery C-rate
C1 = 10; C2 = 20; C3 = 30; C4 = 40; C5 = 50;
C6 = 60; C7 = 70; C8 = 80; C9 = 90; C10 = 100;

% Max Current, Flight Current, Max Power
ImaxFL = Io + ImM * Nm
Ifly = ImaxFL * Lfly
Wmax = ImaxFL * Vbatnom

% expected flight time
Tflight = ((Qcap./1000)/(Ifly))*60;
TflightDR = (((Qcap./1000)/(Ifly))*60)*DR;

% number of batteries needed
NbatReqC1 = (ImaxFL)./((Qcap.*C1)./1000); NbatReqC2 = (ImaxFL)./((Qcap.*C2)./1000);
NbatReqC3 = (ImaxFL)./((Qcap.*C3)./1000); NbatReqC4 = (ImaxFL)./((Qcap.*C4)./1000);
NbatReqC5 = (ImaxFL)./((Qcap.*C5)./1000); NbatReqC6 = (ImaxFL)./((Qcap.*C6)./1000);
NbatReqC7 = (ImaxFL)./((Qcap.*C7)./1000); NbatReqC8 = (ImaxFL)./((Qcap.*C8)./1000);
NbatReqC9 = (ImaxFL)./((Qcap.*C9)./1000); NbatReqC10 = (ImaxFL)./((Qcap.*C10)./1000);

figure(1)
tiledlayout(2,1) % Requires R2019b or later 

nexttile
plot (Qcap,Tflight);
legend('Flight Time (mins)', 'location','NorthEast'); 
grid on
grid minor
xlabel('Battery capacity (mAh)');
ylabel('time (mins)');
title('Flight time at various battery capacities');

nexttile
plot (Qcap,TflightDR);
legend('Discharge Rule Flight Time (mins)', 'location','NorthEast'); 
grid on
grid minor
xlabel('Battery capacity (mAh)');
ylabel('time (mins)');
title('Flight time at various battery capacities');

figure(2)
hold on
plot (Qcap,NbatReqC1); plot (Qcap,NbatReqC2); plot (Qcap,NbatReqC3); 
plot (Qcap,NbatReqC4); plot (Qcap,NbatReqC5); plot (Qcap,NbatReqC6); 
plot (Qcap,NbatReqC7); plot (Qcap,NbatReqC8); plot (Qcap,NbatReqC9); 
plot (Qcap,NbatReqC10);
grid on
grid minor
legend('10C','20C', '30C', '40C','50C','60C', '70C', '80C', '90C', '100C', ...
        'location','NorthEast');
ylim([0 4]);
ylabel('Number of batteries required');
xlabel('Battery capacity (mAh)');
title('Number of batteries required for various battery capacities');
ax.FontSize = 18;
hold off

Crange = 0 : 5 : 150;
NbatReq = (ImaxFL)./((975.*Crange)./1000);

figure(3)
plot (Crange,NbatReq);
legend('Number of batteries required', 'location','NorthEast'); 
grid on
grid minor
xlabel('C rate');
ylim([0 4]);
ylabel('Number of batteries required');
title('Number of batteries required for various C rates');



