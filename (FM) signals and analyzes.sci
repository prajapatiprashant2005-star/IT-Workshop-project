// ============================================
// AM/FM RADIO SIGNAL SIMULATION (SCILAB)
// ============================================

clc; close; clf;

// ================= PARAMETERS =================
fs = 1000;          // Sampling frequency
t = 0:1/fs:1;       // Time vector

fm = 5;             // Message frequency
fc = 50;            // Carrier frequency

Am = 1;             // Message amplitude
Ac = 2;             // Carrier amplitude

// ================= SIGNALS =================
message = Am * sin(2*%pi*fm*t);         // Message signal
carrier = Ac * sin(2*%pi*fc*t);         // Carrier signal

// ================= AM MODULATION =================
AM = (Ac + message) .* sin(2*%pi*fc*t);

// ================= FM MODULATION =================
beta = 5;  // Modulation index
FM = Ac * sin(2*%pi*fc*t + beta*sin(2*%pi*fm*t));

// ================= MULTI GRAPH =================
scf(0); clf();

// -------- GRAPH 1: MESSAGE --------
subplot(3,3,1);
plot(t, message);
xtitle("Message Signal","Time","Amplitude");

// -------- GRAPH 2: CARRIER --------
subplot(3,3,2);
plot(t, carrier);
xtitle("Carrier Signal","Time","Amplitude");

// -------- GRAPH 3: AM SIGNAL --------
subplot(3,3,3);
plot(t, AM);
xtitle("AM Signal","Time","Amplitude");

// -------- GRAPH 4: FM SIGNAL --------
subplot(3,3,4);
plot(t, FM);
xtitle("FM Signal","Time","Amplitude");

// -------- GRAPH 5: AM SPECTRUM --------
subplot(3,3,5);
AM_fft = abs(fft(AM));
plot(AM_fft);
xtitle("AM Frequency Spectrum","Frequency","Magnitude");

// -------- GRAPH 6: FM SPECTRUM --------
subplot(3,3,6);
FM_fft = abs(fft(FM));
plot(FM_fft);
xtitle("FM Frequency Spectrum","Frequency","Magnitude");

// -------- GRAPH 7: MESSAGE vs AM --------
subplot(3,3,7);
plot(message, AM, 'r.');
xtitle("Message vs AM","Message","AM");

// -------- GRAPH 8: 3D SIGNAL (🔥) --------
subplot(3,3,8);
param3d(t(1:200), message(1:200), AM(1:200));
xtitle("3D AM Signal","Time","Message");

// -------- GRAPH 9: 3D FM SIGNAL --------
subplot(3,3,9);
param3d(t(1:200), message(1:200), FM(1:200));
xtitle("3D FM Signal","Time","Message");

// FORCE DISPLAY
drawnow();

// ================= CONSOLE OUTPUT =================
disp("===== AM/FM SIMULATION REPORT =====");
printf("Message Frequency = %d Hz\n", fm);
printf("Carrier Frequency = %d Hz\n", fc);
disp("AM and FM signals generated successfully!");
