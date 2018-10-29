%tao not nhac va giai dieu
Amp = 0.1;
t = 0:0.000125:0.499875;
fs = 8000; 
a=Amp*sin(2*pi*445*t); 
b=Amp*sin(2*pi*493*t); 
c=Amp*sin(2*pi*554*t); 
d=Amp*sin(2*pi*587*t); 
e=Amp*sin(2*pi*659*t); 
f=Amp*sin(2*pi*739*t);
y1=[a,d,e,c,b,b,f,e,a,c,a,c,d,e,f,e,a,b,d,e,f,a,b,d,f,e,f,a,c,b,a,e,f,d,f,b,c,a,b,d,e,c,b,b,f,e,a,c,a,c,d,e,f,e,a,b,d,e,f,a,b,d,f,e,f,a,c,b,a,e,f,d,f,b,c,a,b,d,e,c,b,b,f,e,a,c,a,c,d,e,f,e,a,b,d,e,f,a,b,d,d,e,c,b,b,f,e,a,c,a,c,d,e,f,e,a,b,d,e,f,a,b,d,f,e,f,a,c,b,a,e,f,d,f,b,c,a,b,f,e,f,a,c,b,a,e,f,d,f,b,c,a,b];
audiowrite('melody.wav',melody,44100);
%doc tin hieu dau vao
[y2,fs]=audioread('orig_input.wav');
x1=y2;
x2 = x1(1:length(y1));
x= x2 + y1;
audiowrite('mana.wav',x,44100);
sound(x,40000)
%Chuyen doi FFT
[y,fs]=audioread('melody.wav');
N =fs
transform = fft(y,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
figure(1);
plot(faxis,fftshift(magTransform));
title('The Spectrum');
xlabel('Frequency (Hz)')
figure(2);
%tao spectrogram
win = 128; 
% number of samples between overlapping windows:
hop = win/2;          

nfft = win; % width of each frequency bin 
spectrogram(y,win,hop,nfft,fs,'yaxis')



