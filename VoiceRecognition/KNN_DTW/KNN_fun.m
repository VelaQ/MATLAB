%% KNN_FUN KNN�㷨ƥ��������ѵ��
% data����������
% K��ָ��KNNϵ��
% result:����ƥ����
function [result] = KNN_fun(dis, K, dataNum)
    % ��֪�����ݷֲ����
    distribution = [ones(1,dataNum/2) 2*ones(1,dataNum/2)];
    % �����ҵ���С���벢���
    [~, ind] = sort(dis);
    K = K - 1 + mod(K, 2);
    temp = tabulate(distribution(ind(1:K)));
    [~, I] = max(temp(:, 3));
    result = temp(I, 1);
end
