function [coefs EdgeEffect]=NTFT(sig,AngFrqs,l,t0)
% complete the Normal Time-frequency Transform
% sig-imput signal % column or row??????
% AngFrqs-angle frequencies
% variance- variance of the normal Gaussian window
% t0- sample time of the imput signal 输入信号的采样间隔
% l- 窗口宽度
lens=length(sig);                                    % length of signal  

%%***********  Time-Frequency Transform(TFT)  ************%%
for jj=1:length(AngFrqs)
    AngleFrq=AngFrqs(jj);     % angle frequency
    EdgeEffect(jj)=ceil(l/2/abs(AngleFrq));
    kernel=TFKerFun_Gaussian(AngleFrq,l,t0);         
    
%%***********  TFT  **************************************%%
    coefs(jj,:)=abs(AngleFrq)*t0*wkeep(conv(sig,conj(fliplr(kernel))),lens);  % convolution
end

%%% ceil函数的作用是朝正无穷方向取整，即将m/n的结果向正无穷方向取整，如m/n=3.12，则ceil(m/n)的结果为4。
%%% wkeep功能：提取时间序列中的一个子序列。
%%% 格式：y = wkeep(x, l, opt) % 从时间序列x中提取长度为l的一个时间序列y。当输入参数opt=’c’时，则从x的中间提取；当opt=’l’,则从x的左边提取；当输入参数为opt=’r’时，则从x的右边提取。
%%% conj 求共轭函数
%%% fliplr  左右翻转矩阵

