%% RayAWGN ģ�������ŵ������Ӹ�˹����
% outputSignal : ��������ź�
% G��˥��ϵ��
function [outputSignal, G] = RayAWGN(inputSignal, EbN0dB, M)
    % �źŵ����
    len = length(inputSignal);
    % �������������������ź���, GҲ��˥��ϵ��
    G = raylrnd(1 / sqrt(2), 1, len) .* exp(2 * pi * 1j * rand(1, len));
    outputSignal = inputSignal .* G;
    
    % ��˹������ķ��ͨ�� EbNodB ����
    sigma_v2 = 10^(EbN0dB / -10) / (2 * log2(M));
    % ��˹�������׼��(ֻ���޸ķ����)
    sigma = sqrt(sigma_v2);
    % ���Ӹ�˹����
    outputSignal = outputSignal + normrnd(0, sigma, [1 len]) + 1j * normrnd(0, sigma, [1 len]);
end
