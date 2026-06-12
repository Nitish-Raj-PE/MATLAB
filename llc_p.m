

%--------------  DC Input -----------------

Vin = 100;              % operating input voltage
Vin_rated = 100;       % rated input voltage

Vin_min = 90;       % minimum input voltage
Vin_max = 110;      % maximum input voltage

%-------------- Output Load -----------------

Vo = 50;             % operating output voltage
Vo_rated = 50;         % rated output voltage

Vo_min = 45;       % minimum output voltage
Vo_max = 55;      % maximum output voltage

Po_rated = 500;             % rated output power

K_load = 1;           % load percentage with respect to the rated load

Q_rated = 0.3;       % Q factor at the rated condition

%-------------- Operating Conditions -----------------

f_res = 40000;           % resonant frequency

K_ind = 6;           % parallel-to-series inductance ratio

K_rel_freq = 0.445296;           % relative frequency factor for open-loop operation


%********************************************
%
%     Parameters from Calculation
%
%********************************************

fsw = f_res*K_rel_freq;    % switching frequency fsw 

%-------------- Transformer and Load -----------------

a_sp = (Vo_max+Vo_min)/(2*Vin_rated);  % Ns/Np ratio
a_sp2 = a_sp*a_sp;

Ro_rated = Vo_rated*Vo_rated/Po_rated;      % rated load resistance

Ro_rated_pri = Ro_rated/a_sp2;    % Ro_rated referred to the primary side

Ro = Ro_rated/K_load;         % load resistance at the operating conditions

%-------------- Resonant Circuit -----------------

% Minimum gain and maximum gain required
G_dc_min = Vo_min/(a_sp*Vin_max);     % minimum gain
G_dc_max = Vo_max/(a_sp*Vin_min);     % maximum gain

% resonant inductance 
Ls = (Q_rated*Ro_rated_pri)/(2*pi*f_res);   

% resonant capacitance
Cs = 1/(2*pi*f_res*Q_rated*Ro_rated_pri);   

% transformer magnetizing inductance
Lm = K_ind*Ls;     

% Q value at the operating conditions
%Q = Zo / R;  Zo = sqrt(Ls/Cs);
Q = sqrt(Ls/Cs)/(Ro/a_sp2);   