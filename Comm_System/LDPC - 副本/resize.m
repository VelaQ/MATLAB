%% RESIZE ����������״
% �ı����ĳ���ͬʱ����Ԫ�ص����˳�򲻱�
function [output] = resize(input, sz1, sz2)
    siz = size(input);
    % �ܳ���
    len = siz(1) * siz(2);
    if (isempty(sz1))
        sz1 = len / sz2;
    end
    if (isempty(sz2))
        sz2 = len / sz1;
    end
    if (sz1 * sz2 < len)
        error('Ҫ���ά�Ȳ�ƥ��');
    end
    % Ԥ�����ڴ棬�ӿ��ٶ�
    output = zeros(sz1, sz2);
    for i = 1:len
        output(i) = input(i);
    end
end
