load SZ.mat
R1=tick2ret(SZ,[],'Simple');  
%����ʮ��ֻ��Ʊ�������ʾ���
expr=mean(R1);              
%�������ʾ�ֵ�����ִ���NaN
EXPR=nanmean(R1);           
%�Ż����򣬵õ����������ʾ���
expcov=cov(R1);
%�������ʵ�Э���ͬ�����ִ���NaN             
ExpCov=nancov(R1);
%�Ż�����
M=1000;N=17;
X1=zeros(M,N);
for i=1:M
    X1(i,:)=rand(1,N)
    X1(i,:)=X1(i,:)/sum(X1(i,:));
end
M=1000;N=17;
X5=zeros(M,N);
for i=1:M
    X5(i,:)=rand(1,N)
    X5(i,:)=X5(i,:)/sum(X5(i,:));
end
X8=zeros(M,N);
for i=1:M
    X8(i,:)=rand(1,N)
    X8(i,:)=X8(i,:)/sum(X8(i,:));
end
X2=zeros(M,N);
for i=1:M
    X2(i,:)=rand(1,N)
    X2(i,:)=X2(i,:)/sum(X2(i,:));
end
load X3.mat
load X4.mat
load X6.mat
load X7.mat
load X9.mat
load X10.mat
Weights=[X1;X2;X3;X4;X5;X6;X7;X8;X9;X10];
%��������10000*17�ľ�����Ҫ�ķѴ���ʱ�䣬������������������10��1000*17�ľ���Ȼ��������ϳ�һ���µ�10000*17�ľ��󣬿��ԽϿ�صõ�10000��Ȩ�ء�
for i=1:10000
[PortRisk(i),PortReturn(i)]=portstats(EXPR,ExpCov,Weights(i,:));
end
%�ֱ������17֧��Ʊ�ķ�������
plot(PortRisk,PortReturn,'r.')
%���Ƴ���������ɢ��ͼ
p = Portfolio('assetmean', EXPR, 'assetcovar', ExpCov, 'lowerbudget', 1, 'upperbudget', 1, 'lowerbound', 0);
plotFrontier(p)
%������Чǰ������
weights = estimateMaxSharpeRatio(p);
[risk, ret] = estimatePortMoments(p, weights);
hold on
plot(risk,ret,'*r');