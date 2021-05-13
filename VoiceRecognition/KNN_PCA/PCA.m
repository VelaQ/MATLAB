% һάPCAʵ��
% X�����������Ϣ
% num����Ϣ������Ҳ���ļ�����
% mu����ֵ�趨
function [outputArg1] = PCA(X, num, mu)
    % ���ֵ��
    X_zeroMean = X - mean(X);
    % Э�������
    C = 1 / num * (X_zeroMean * X_zeroMean');
    % ������ֵ����������
    [V, D] = eig(C);
    [d, ind] = sort(diag(D), 'descend');
    % ������ֵ��С����
    Vs = V(:, ind);
    % ������ֵѡ�� ���͵�ά��
    for k = 1:length(d)
        if (sum(d(1:k)) / sum(d) >= mu)
            break;
        end
    end
    outputArg1 = Vs(:, 1:k)' * X;
end
