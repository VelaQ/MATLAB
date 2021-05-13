clc; clear all; close all;

%% ��������
k = 1024;
n = 2560;
m = 512;
RATE = k / (n - m);
EbN0dB = 1.5:0.3:3;
LDPC_EbN0dB = log10(10.^(EbN0dB / 10) * n / k) * 10;
len = length(EbN0dB);
% LDPC֡������������ĵ���Ϊ FRAMES_NUM * k ����Ϣλ
FRAMES_NUM = 100;
% ����������
MAX_ITER_NUM = 200;
MAX_ERROR_FRAME = 200;
bitError = zeros(1, length(EbN0dB));
LDPC_BER = zeros(1, len);
iterNumTotal = zeros(1, length(EbN0dB));
NORM_FACTOR = 0.8;

%%
% HΪ����CCSDS��׼��У�����GΪ��Ӧ
% H = ccsdscheckmatrix(SIZE_M,RATE);
% G = ccsdsgeneratematrix(H,SIZE_M,RATE);
load 'G.mat'
load 'H.mat'

%% BPSK���ơ����

bpskMod = @(msg) 2 * msg - 1;
msg = randi([0 1], 1, k);
encodeData = LDPC_Encoder(G, msg);
transmitSignal = bpskMod(encodeData);
%% LDPC����
for i = 1:length(EbN0dB)
    for j = 1:FRAMES_NUM
        
        receiveSignal = AWGN2(LDPC_EbN0dB(i), transmitSignal);
        % punching
        %receiveSignal(end - 1 * m + 1:end - 0 * m) = 0;
        %%
        % decode
        [iterNum, recoverData] = LDPC_Decoder(H, receiveSignal, MAX_ITER_NUM, NORM_FACTOR);
        %%
        % BER,FER and iterations
        bitError(i) = bitError(i) + ErrRate(msg, recoverData(1:length(msg)));
        iterNumTotal(i) = iterNumTotal(i) + iterNum;
    end
    LDPC_BER(i) = bitError(i)/(FRAMES_NUM*k);
end

%% simulation result
%%
fclose(fid);
readtable(FILE_NAME, 'HeaderLines', 6, 'Delimiter', '\t')
semilogy(EbN0dB, BER, 'r');
xlabel('Eb/N0(dB)'); ylabel('BER');
grid on;
