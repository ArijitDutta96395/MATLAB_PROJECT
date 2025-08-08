n1=-1:1:2;
n2=-2:1:3;
n3=-2:1:3;
x1=[1 -1 2 3];
x2=[1 2 3 4];
x3=[1 0 1 0];

x2r=[1 2 3 4 0 0]; 
x3r=[0 0 1 0 1 0];
f=[x2r]+[x3r];

subplot (2,2,1); 
stem (n3,f);
disp(f);

n4=(-2-1):(2+3);
y=conv(f,xl);
subplot(2,2,2);
stem (n4,y);
disp(y);

n5=(-1-2):(2+1); 
x=conv(x1,x2); 
stem (n5,x);
cl=[1 1 3 8 8 17 12 0 0];

n6=(-1-0):(2+3); 
d=conv(x1,x3); 
subplot(2,2,3); 
stem(n6, d, 'r+');
hold on
c2=[0 0 1 -1 3 2 2 3 0];

n7=-3:5;
o=[cl]+[c2];
subplot(2,2,4);
stem(n7,o, 'b');
grid on;
legend('c2', 'o')