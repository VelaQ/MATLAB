% ��MEL��ͼ������ȡ
% �ο�ppt����ÿ���������ݷֽ��9�������㲢����
% num����Ϣ����
function [outputArg] = MelSpe(inputArg)
  f = 0 : length(inputArg);
  melHz = 2595*log10(1 + f);
  outputArg = inputArg(melHz);
end
