% ��MEL��ͼ������ȡ
% �ο�ppt����ÿ���������ݷֽ��9�������㲢����
% num����Ϣ����
function [outputArg] = MelSpe(inputArg, num)
n = 1024;
outputArg = zeros(n + 1, num);
for i = 1 : num
    for j = 1 : n
        outputArg(j, i) = sum(abs(inputArg(j , i).^2));
    end
    outputArg(n + 1, i) = sum(abs(inputArg(:, i)).^2);
end
end
