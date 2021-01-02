% �����ʣ�������ʼ��㺯��
% numOfErrs������Ĵ�������
% errRate��������
% oriData��ԭʼ����
% demodData������������
function [numOfErrs, errRate] = ErrRate(oriData, demodData, method)
    numOfErrs = 0;
    % ��Ҫ����� BER��������ת���ɶ�������ʽ
    if strcmp(method, 'ber')
        oriData = de2bi(oriData);
        demodData = de2bi(demodData);
    end

    % ��ȡ���ݸ���
    lenOfSignal = size(oriData, 1) * size(oriData, 2);
    % ���� BER �� SER����һ�ȶ�
    for index = 1:lenOfSignal
        % �����������������һ
        if oriData(index) ~= demodData(index)
            numOfErrs = numOfErrs + 1;
        end
    end

    % ������ʼ���
    errRate = numOfErrs / lenOfSignal;
end
