%%%%Q1
load R.mat
jz=corrcoef(R);
jz2=abs(jz);
imagesc(jz2);
colorbar
%��ʦ�����colorbar������ͼ���ܸ����ǵ�ͼ����һ����ɫ�����ǵ���summerͼ�������Դӱ༭-��ɫͼ-����-��׼��ɫͼ-summer·������
