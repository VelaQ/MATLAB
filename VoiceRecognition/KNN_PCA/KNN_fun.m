%% KNN_FUN KNN�㷨ƥ��������ѵ��
% data����������
% K��ָ��KNNϵ��
% result:����ƥ����
function [result] = KNN_fun(data, K, mu)
    %% ����ѵ����
    P = load(['voice_PCA_' num2str(mu) '.csv']);
    % ��֪�����ݷֲ����
    distribution = [ones(1, 16) 2 * ones(1, 15) 3 * ones(1, 15) 4 * ones(1, 24) 5 * ones(1, 12) 6 * ones(1, 28) 7 * ones(1, 18)];
    % ��������
    Distance = sum(abs(P - data).^2, 1);
    % �����ҵ���С���벢���
    [~, ind] = sort(Distance);
    K = K - 1 + mod(K, 2);
    temp = tabulate(distribution(ind(1:K)));
    [~, I] = max(temp(:, 3));
    result = temp(I, 1);
end
