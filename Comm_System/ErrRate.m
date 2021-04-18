% �����ʣ�������ʼ��㺯��
% numOfErrs������Ĵ�������
% errRate��������
% oriData��ԭʼ����
% demodData������������
function [numOfErrs, errRate] = ErrRate(oriData, demodData)
    numOfErrs = 0;

    % ��ȡ���ݸ���
    lenOfSignal = size(oriData, 1) * size(oriData, 2);
    % ���� BER �� SER����һ�ȶ�
    for index = 1 : lenOfSignal
        % �����������������һ
        if oriData(index) ~= demodData(index)
            numOfErrs = numOfErrs + 1;
        end
    end

    % ������ʼ���
    errRate = numOfErrs / lenOfSignal;
end
