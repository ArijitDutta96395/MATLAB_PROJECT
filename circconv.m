n1=0:3;
x1=[1 0 1 0];
x2=[0 1 0 1];
x3=x1';
for i =1 : 3
        x3= [x3, circshift(x1',i)];
end    
x4=x3*x2';
stem(n1,x4);
xlabel('time')
ylabel('Ampliotude');

