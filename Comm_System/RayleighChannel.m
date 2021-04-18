%RAYLEIGHCHANNEL ģ�������ŵ�
function [outputSignal , R] = RayleighChannel(inputSignal)
    % �źŵ����
    len = length(inputSignal);
    % �������������������ź��ϣ�Ȼ�����
    %rayNoise = 1/sqrt(2)*(randn(1,len) + 1j*(randn(1,len)));
    rayNoise = raylrnd(1/sqrt(2), 1, len) .* exp(2 * pi * 1j * rand(1, len));
    outputSignal = inputSignal .* rayNoise;
    R = rayNoise;
end
