function [coefs EdgeEffect]=NTFT(sig,AngFrqs,l,t0)
% complete the Normal Time-frequency Transform
% sig-imput signal % column or row??????
% AngFrqs-angle frequencies
% variance- variance of the normal Gaussian window
% t0- sample time of the imput signal �����źŵĲ������
% l- ���ڿ��
lens=length(sig);                                    % length of signal  

%%***********  Time-Frequency Transform(TFT)  ************%%
for jj=1:length(AngFrqs)
    AngleFrq=AngFrqs(jj);     % angle frequency
    EdgeEffect(jj)=ceil(l/2/abs(AngleFrq));
    kernel=TFKerFun_Gaussian(AngleFrq,l,t0);         
    
%%***********  TFT  **************************************%%
    coefs(jj,:)=abs(AngleFrq)*t0*wkeep(conv(sig,conj(fliplr(kernel))),lens);  % convolution
end

%%% ceil�����������ǳ��������ȡ��������m/n�Ľ�����������ȡ������m/n=3.12����ceil(m/n)�Ľ��Ϊ4��
%%% wkeep���ܣ���ȡʱ�������е�һ�������С�
%%% ��ʽ��y = wkeep(x, l, opt) % ��ʱ������x����ȡ����Ϊl��һ��ʱ������y�����������opt=��c��ʱ�����x���м���ȡ����opt=��l��,���x�������ȡ�����������Ϊopt=��r��ʱ�����x���ұ���ȡ��
%%% conj �����
%%% fliplr  ���ҷ�ת����

