R1=-5;
R2=5;
x1=[];
x2=[];
x3=[];
x4=[];
x5=[];
x6=[];
Y_1= [];
Y_2=[];
for i=1:10000
    x1(i)=(R2-R1)*rand+R1;
    x2(i)=(R2-R1)*rand+R1;
    x3(i)=(R2-R1)*rand+R1;
    x4(i)=(R2-R1)*rand+R1;
    x5(i)=(R2-R1)*rand+R1;
    x6(i)=(R2-R1)*rand+R1;
    Y_1(i)= x1(i)+x2(i)+x3(i)+x4(i)+x5(i)+x6(i);
    Y_2(i)=x1(i)+(x2(1)*.5)+(x3(i)*.8)+(x4(i)+1.8)+(x5(i)*.3)+(x6(i)*.5);
end

figure(1)
subplot(3,2,1);plot(x1);title('x1');
subplot(3,2,2);plot(x2);title('x2');  
subplot(3,2,3);plot(x3);title('x3');
subplot(3,2,4);plot(x4);title('x4');
subplot(3,2,5);plot(x5);title('x5');
subplot(3,2,6);plot(x6);title('x6');

figure(2)
subplot(2,1,1);hist(Y_1,30);title('PDF - Y1');
subplot(2,1,2);hist(Y_2,30);title('PDF - Y2');

figure(3)
subplot(2,1,1);cdfplot(Y_1);title('CDF - Y1');
subplot(2,1,2);cdfplot(Y_2);title('CDF - Y2');

%% b

sum1=0;
for i=1:length(Y_1)
    sum1=sum1+Y_1(i);
end
Mn=sum1/length(Y_1)

sum2=0;
for i=length(Y_1)
    sum2=sum2+(Y_1(i)-Mn)^2;
end
sigma2=sum2/length(Y_1);


    