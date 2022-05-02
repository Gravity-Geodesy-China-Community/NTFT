function kernel=TFKerFun_Gaussian(AngFrqs,win_len,t0)

% Output kernel function of  time-frequency transform;
% AngleFrq: angle frequency;
% sd: standard deviation of Gaussian Window
% iter: an exponent to define the integration step
step=abs(AngFrqs)*t0;
std=win_len/10;
win_edge=ceil(win_len/2/step);
xval_dt=[step*(-win_edge:1:-1) 0 step*(1:win_edge)];
%xval_dt=-win_len/2:step:win_len/2;%(-len_win/2:t0:len_win/2)/AngleFrqs;%AngleFrqs*(floor(-l/AngleFrqs):t0:ceil(l/AngleFrqs));  %  dilation index w;
win=exp(-xval_dt.^2/2/std/std)/sqrt(2*pi)/std;    %  dilated window;  AngleFrqs*
kernel=win.*exp(i*sign(AngFrqs)*xval_dt);                       %  kernel function of time-frequency transform;


%% sign(x)：符号函数 (Signum function)。
%% 当x<0时，sign(x)=-1；
%% 当x=0时，sign(x)=0; 
%% 当x>0时，sign(x)=1。
%%  