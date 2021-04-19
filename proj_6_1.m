%% Kaitlyn Hart, Joshua Proulx and Christopher Gravelle -- Matlab Project 6.1 -- 04/18/21
%% Part 1
format compact, clc, clear, close all
figNum = 0;
R1=-0.5; % lower bound
R2=0.5; % upper bound
N = 10e3; % number of samples
Nvar = 6; % number of independent random variables
weights_Y2 = [1; 0.5; 0.8; 1.8; 0.3; 0.5]; % weight vector for Y2

X = R1+(R2-R1)*rand(Nvar,N); % generate 6 independent r.v.s
% Y1 and Y2 are linear combinations of independent random variables
Y1 = sum(X,1); 
Y2 = sum(weights_Y2.*X,1);

% Part 1 (a) PDF Histogram estimates of Y1 and Y2
figNum=figNum+1;
figure(figNum)
hist_Y1 = histogram(Y1,'Normalization','pdf');
title('Normalized Histogram Estimate of PDF of Y_{1} (Uniform R.V.s)')
xlabel('Y_{1}'); ylabel('Probability Density');
histArea_Y1 = sum(hist_Y1.Values)*hist_Y1.BinWidth;

figNum=figNum+1;
figure(figNum)
histogram(Y1,'Normalization','cdf');
title('Normalized Histogram Estimate of CDF of Y_{1} (Uniform R.V.s)')
xlabel('Y_{1}'); ylabel('Cumulative Probability')

figNum=figNum+1;
figure(figNum)
hist_Y2 = histogram(Y2,'Normalization','pdf');
title('Normalized Histogram Estimate of PDF of Y_{2} (Uniform R.V.s)')
xlabel('Y_{2}'); ylabel('Probability Density');
histArea_Y2 = sum(hist_Y2.Values)*hist_Y2.BinWidth;

figNum=figNum+1;
figure(figNum)
histogram(Y2,'Normalization','cdf');
title('Normalized Histogram Estimate of CDF of Y_{2} (Uniform R.V.s)')
xlabel('Y_{2}'); ylabel('Cumulative Probability')

% Part 1 (b)
mu_Y1 = mean(Y1);
sigma2_Y1 = std(Y1)^2;

mu_Y2 = mean(Y2);
sigma2_Y2 = std(Y2)^2;

gauss = @(x,mu,sigma) (1./(sigma.*sqrt(2.*pi))).*exp(-(1/2).*((x-mu)./sigma).^2);

% Part 1 (c)
[pdf_Y1,cdf_Y1,xxp_Y1,xxc_Y1] = PdfCdf(Y1,hist_Y1.NumBins);
[pdf_Y2,cdf_Y2,xxp_Y2,xxc_Y2] = PdfCdf(Y2,hist_Y2.NumBins);

figNum=figNum+1;
figure(figNum)
plot(xxp_Y1,pdf_Y1)
title('Estimated PDF of Y_{1} vs. True Gaussian Curve (Uniform R.V.s)')
xlabel('Y_{1}'); ylabel('Probability Density')
grid on
hold on
plot(xxp_Y1,gauss(xxp_Y1,mu_Y1,sqrt(sigma2_Y1)),'r--')
legend('Estimated Curve','Gaussian Curve')

figNum=figNum+1;
figure(figNum)
plot(xxp_Y2,pdf_Y2)
title('Estimated PDF of Y_{2} vs. True Gaussian Curve (Uniform R.V.s)')
xlabel('Y_{2}'); ylabel('Probability Density')
grid on
hold on
plot(xxp_Y2,gauss(xxp_Y2,mu_Y2,sqrt(sigma2_Y2)),'r--')
legend('Estimated Curve','Gaussian Curve')

figNum=figNum+1;
figure(figNum)
plot(xxc_Y1,cdf_Y1)
title('Estimated CDF of Y_{1} vs. True Gaussian Curve (Uniform R.V.s)')
xlabel('Y_{1}'); ylabel('Cumulative Probability')
grid on
hold on
plot(xxc_Y1,cdf('Normal',xxc_Y1,mu_Y1,sqrt(sigma2_Y1)),'r--')
legend('Estimated Curve','Gaussian Curve','Location','Southeast')

figNum=figNum+1;
figure(figNum)
plot(xxc_Y2,cdf_Y2)
title('Estimated CDF of Y_{2} vs. True Gaussian Curve (Uniform R.V.s)')
xlabel('Y_{2}'); ylabel('Cumulative Probability')
grid on
hold on
plot(xxc_Y1,cdf('Normal',xxc_Y2,mu_Y2,sqrt(sigma2_Y2)),'r--')
legend('Estimated Curve','Gaussian Curve','Location','Southeast')

%% Part 2

figNum = 8;
N = 10e3;
Nvar = 20;
lambda = ((1:Nvar)*0.5).';
lambda = lambda.*ones(Nvar,N);
X = exprnd(lambda);
Y = sum(X,1);

% Part 2 (a)
figNum=figNum+1;
figure(figNum)
hist_Y = histogram(Y,'Normalization','pdf');
title('Normalized Histogram Estimate of PDF of Y (Exponential R.V.s)')
xlabel('Y'); ylabel('Probability Density');
histArea_Y = sum(hist_Y.Values)*hist_Y.BinWidth;

figNum=figNum+1;
figure(figNum)
histogram(Y,'Normalization','cdf');
title('Normalized Histogram Estimate of CDF of Y (Exponential R.V.s)')
xlabel('Y'); ylabel('Cumulative Probability')

% Part 2 (b)
mu_Y = mean(Y);
sigma2_Y = std(Y).^2;

% Part 2 (c)

[pdf_Y,cdf_Y,xxp_Y,xxc_Y] = PdfCdf(Y,hist_Y.NumBins);

figNum=figNum+1;
figure(figNum)
plot(xxp_Y,pdf_Y)
title('Estimated PDF of Y vs. True Gaussian Curve (Exponential R.V.s)')
xlabel('Y'); ylabel('Probability Density')
grid on
hold on
plot(xxp_Y,gauss(xxp_Y,mu_Y,sqrt(sigma2_Y)),'r--')
legend('Estimated Curve','Gaussian Curve')

figNum=figNum+1;
figure(figNum)
plot(xxc_Y,cdf_Y)
title('Estimated CDF of Y vs. True Gaussian Curve (Exponential R.V.s)')
xlabel('Y'); ylabel('Cumulative Probability')
grid on
hold on
plot(xxc_Y,cdf('Normal',xxc_Y,mu_Y,sqrt(sigma2_Y)),'r--')
legend('Estimated Curve','Gaussian Curve','Location','Southeast')

%% Part 3

figNum = 12;
N = 10e3;
Nvar = 50;
p = 0.8;

B = double((rand(Nvar,N)<p));

P_B = zeros(Nvar,2);
for idx = 1:Nvar
   [P_B(idx,:),~,xx] = PmfCdf(B(idx,:));  
end

Y = conv(P_B(1,:),P_B(2,:));
for idx = 3:Nvar
   Y = conv(Y,P_B(idx,:)); 
end

figNum=figNum+1;
figure(figNum)
plot(0:50,Y)
title('Convolution of 50 Bernoulli R.V.s')
xlabel('Y_{B}'); ylabel('Probability Density')

mu_B_theor = p*Nvar;
sigma_B_theor = sqrt(p*(1-p)*Nvar);

