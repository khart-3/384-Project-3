R1=-5;
R2=5;
x1=[];
x2=[];
x3=[];
x4=[];
x5=[];
x6=[];
y_1= [];
y_2=[];
for i=1:10000
    x1(i)=(R2-R1)*rand+R1;
    x2(i)=(R2-R1)*rand+R1;
    x3(i)=(R2-R1)*rand+R1;
    x4(i)=(R2-R1)*rand+R1;
    x5(i)=(R2-R1)*rand+R1;
    x6(i)=(R2-R1)*rand+R1;
    y_1(i)= x1(i)+x2(i)+x3(i)+x4(i)+x5(i)+x6(i);
    y_2(i)=x1(i)+(x2(1)*.5)+(x3(i)*.8)+(x4(i)+1.8)+(x5(i)*.3)+(x6(i)*.5);
end

figure(1)
subplot(3,2,1);plot(x1);title('x1');
subplot(3,2,2);plot(x2);title('x2');  
subplot(3,2,3);plot(x3);title('x3');
subplot(3,2,4);plot(x4);title('x4');
subplot(3,2,5);plot(x5);title('x5');
subplot(3,2,6);plot(x6);title('x6');

figure(2)
subplot(2,1,1);hist(y_1,20);title('PDF - y1');
subplot(2,1,2);hist(y_2,20);title('PDF - y2');

figure(3)
subplot(2,1,1);cdfplot(y_1);title('CDF - y1');
subplot(2,1,2);cdfplot(y_2);title('CDF - y2');

    