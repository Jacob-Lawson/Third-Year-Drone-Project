% Stator Sizing Comparison
% Power is based on Stator Volume
% Volume = pi*r^2*L
% r = stator radius
% L = stator length

d = 01 : 01 : 30;
r = d/2;

% Stator Lengths
L1 = 01; L2 = 02; L3 = 03; L4 = 04; L5 = 05;
L6 = 06; L7 = 07; L8 = 08; L9 = 09; L10 = 10;

% Stator Volumes
V1 = pi .* r .* r .* L1; V2 = pi .* r .* r .* L2; V3 = pi .* r .* r .* L3;
V4 = pi .* r .* r .* L4; V5 = pi .* r .* r .* L5; V6 = pi .* r .* r .* L6;
V7 = pi .* r .* r .* L7; V8 = pi .* r .* r .* L8; V9 = pi .* r .* r .* L9;
V10 = pi .* r .* r .* L10;

figure (1)
hold on
plot (d,V1); plot (d,V2); plot (d,V3); plot (d,V4); plot (d,V5);
plot (d,V6); plot (d,V7); plot (d,V8); plot (d,V9); plot (d,V10);
grid on
grid minor
legend('1 mm Stator Length','2 mm Stator Length', '3 mm Stator Length', ...
        '4 mm Stator Length','5 mm Stator Length','6 mm Stator Length', ...
        '7 mm Stator Length','8 mm Stator Length','9 mm Stator Length', ...
        '10 mm Stator Length', ...
        'location','NorthWest');
ylabel('Volume (cubic mm)');
xlabel('Stator Diameter (mm)');
title('Stator Volume based on a Stator Length');
ax.FontSize = 18;
hold off

figure(2)
tiledlayout(3,2) % Requires R2019b or later 

nexttile
plot (d,V3);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 3 mm');

nexttile
plot (d,V4);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 4 mm');

nexttile
plot (d,V5);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 5 mm');

nexttile
plot (d,V6);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 6 mm');

nexttile
plot (d,V7);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 7 mm');

nexttile
plot (d,V8);
legend('Volume (cubic mm)', 'location','NorthEast'); 
grid on
grid minor
ylabel('Volume (cubic mm)');
xlabel('Stator diameter (mm)');
title('Stator Volume based on a stator length of 8 mm');

