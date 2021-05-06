% һάPCAʵ�֣����ｫMEL�׵õ���9ά����ѹ����1ά����
% inputArg1�����������Ϣ
% num����Ϣ������Ҳ���ļ�����
% mu����ֵ�趨
function [outputArg1] = PCA(inputArg1, num, mu)
    X = inputArg1;
    % ���ֵ��
    X_zeroMean = X - mean(X);
    % Э�������
    C = 1 / num * (X_zeroMean * X_zeroMean');
    % ������ֵ����������
    [V, D] = eig(C);
    [d, ind] = sort(diag(D), 'descend');
    % ������ֵѡ�� ���͵�ά��
    for k = 1:length(d)
        if (sum(d(1:k)) / sum(d) >= mu)
            break;
        end
    end

    Ds = D(ind, ind);
    Vs = V(:, ind);
    outputArg1 = Vs(:, k)' * X;
end
