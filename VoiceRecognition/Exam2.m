%% Introduction
% use AR(auto-regressive) model and LPC(linear prediction coding) to analyze  the given voice signal
%% load data
load ex5m1.mat;

%% Problem 1 add a hamming window and plot the self-relative function
data = speech1_10k;
% figure(1) show original data
figure(1); plot(data,'LineWidth', 1);title('original data')

% add hamming windows to data
dataHamming = hamming(length(data))' .* data;
% figure(2) show data after hamming
figure(2); plot(dataHamming,'color','#D95319','LineWidth', 1);title('data after add a hamming window')

% self-relative function of data after hamming
relativeFunction = xcorr(dataHamming);
% figure(3) show self-relative function of data after hamming
figure(3); plot(relativeFunction,'color','#7E2F8E','LineWidth', 1);title('self-relative function')

%% Problem 2 construct the self-relative matrix
% use 4 point to describe sound channel
R = relativeFunction(250:254);

% use self-relative method to solve LPC(linear predition coding) problem
% solve the equation AX=Y;X=A-1Y and acquire the LPC coefficient
% the toeplitz matrix
A = toeplitz(R(1:4));
Y = R(2:5)';

%% Problem 3 solve the LPC coefficient and plot the frequency responce
% LPC coefficient, "\" means solve the linear equation set
X = A \ Y;
%calculate the gain A,refer to 5.30
% gainA = sqrt(R(1) - X' * Y);
gainA = abs(R(1) - sum(X.* Y));

% solve the AR model, acquire the frequency response
h = freqz(gainA, [1, -X'], 128);
% plot the frequency response
figure(4);
subplot(2, 1, 1);semilogy(abs(h),'LineWidth', 1);title('AR model frequency response');ylabel('Amplitude Response (dB)')
subplot(2, 1, 2);plot(angle(h),'color','#A2142F','LineWidth', 1);ylabel('Phase Response')
figure(5);
subplot(2, 1, 1);semilogy(abs(h),'LineWidth', 1);title('AR model frequency response');ylabel('Amplitude Response of AR model (dB)');axis([0 130 0 100]);
subplot(2, 1, 2);semilogy(abs(fft(dataHamming, 256)),'color','#77AC30','LineWidth', 1);ylabel('Amplitude Response of data after hamming(dB)');axis([0 130 0 100]);

% %calculate the impulse responce of inverse filter,refer to 5.30
% b = [1 -X'];
% a = 1;
% [h, t] = impz(b, a);
% e0 = conv(data, h);
% e1 = conv(dataHamming, h);
% figure(6);
% subplot(2, 1, 1); plot(e0)
% subplot(2, 1, 2); plot(e1)
% n1 = randn(1, 1000);
% speech_sysn1 = conv(n1, h);
% figure(7); plot(speech_sysn1(1:250))
% sound(speech_sysn1, 10000);
