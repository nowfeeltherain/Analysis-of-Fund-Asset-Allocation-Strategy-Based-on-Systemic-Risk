close all
clear
clc
%%%1 ��matlab������tushare��ȡ����A�ɹ�Ʊ��ʷ����
f = '��Ʊ����.xlsx';%����Ʊ����.xlsx����matlabwork�У�������ʦֱ������һ��Ȼ��ŵ�����·��
[~,stocklist] = xlsread(f);
addpath(genpath(pwd));
% tokenע��tushare����У����ܻ���£������������س����ļ�������ڸ����﹩��ʦ�ο�
% ����tushare����ֲ�����������أ���˻���������;����ֹͣ���أ�����ʦ���
token = '10e7246f79b33f1f8463932bd79c3a27fe9f37a8499f49d6a4144b90';
api = pro_api(token);
start_time = '20190101';
end_time = '20191231';
nstock = length(stocklist);
for i = 1:nstock
    df = api.query('daily', 'ts_code',stocklist{i}, 'start_date',start_time, 'end_date',end_time);
    data = flipud(df);
    writetable(data,['2019�� ',stocklist{i},' ����.xls']);
end
%���ж�ȡ���xls���ֹ�����㼯���ˡ�2019�� SZ���ֹ�Ʊ.xls��