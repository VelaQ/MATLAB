% �����ʣ�������ʼ��㺯��
% numOfErrs������Ĵ�������
% errRate��������
% oriData��ԭʼ����
% demodData������������
function [numOfErrs, errRate] = ErrRate(oriData, demodData)
    % ��ȡ���ݸ���
    lenOfSignal = size(oriData, 1) * size(oriData, 2);
    numOfErrs = length(find(oriData~=demodData));
    % ������ʼ���
    errRate = numOfErrs / lenOfSignal;
end
