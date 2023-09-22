clc
clear all
x1=[1 2 3 4];
x2=[7 8 9];
N=length(x1)+length(x2)-1;
X1=[x1 zeros(1,N)]
X2=[x2 zeros(1,N)]
Y1=[zeros(1,N)]
Y2=[zeros(1,N)]
for i=1:N
    for k=1:N
        Y1(i)=Y1(i)+X1(k)*exp(-(j*2*pi*(k-1)*(i-1))/N);
        Y2(i)=Y2(i)+X2(k)*exp(-(j*2*pi*(k-1)*(i-1))/N);
    end
end
Y=Y1.*Y2;
y=zeros(1,N);
for i=1:N
    for k=1:N
    y(i)=y(i)+Y(k)*exp((j*2*pi*(k-1)*(i-1)/N))/N
    end
    
end
z=abs(y)
disp(z)
