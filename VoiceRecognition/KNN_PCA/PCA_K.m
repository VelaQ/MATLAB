% һάPCAʵ�֣����ｫMEL�׵õ���9ά����ѹ����1ά����
% inputArg1�����������Ϣ
% num����Ϣ������Ҳ���ļ�����
% mu����ֵ�趨
function [outputArg1] = PCA_K(inputArg1, num, K)
    X = inputArg1;
    % ���ֵ��
    X_zeroMean = X - mean(X);
    % Э�������
    C = 1 / num * (X_zeroMean * X_zeroMean');
    % ������ֵ����������
    [V, D] = eig(C);
    [d, ind] = sort(diag(D), 'descend');
    % ������ֵ��С����
    Ds = D(ind, ind);
    Vs = V(:, ind);
    outputArg1 = Vs(:, 1:K)' * X;
end
