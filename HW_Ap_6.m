clear all
clc
close all



n=input('Give the number of nodes:');
C=input('Give the Value Of C:');
m=n-1;%number of elemnts

Q=sym('Q',[n,1]);
U_m1=sym('U',[n,1]);
U_m2=sym('U',[n,1]);
K_m1=sym('K_m1',[n,n]);
K_m2=sym('K_m1',[n,n]);


%model_1_Rigidity matrix
K_m1(1:end,1:end)=zeros(n);

for i=1:n-1
    k_elemnt=(pi*m/12)*(((4*m-3*i)/(m))^2+((4*m-3*i)/(m))*((4*m-3*i+3)/(m))+((4*m-3*i+3)/(m))^2)*[1 -1;-1 1];
    K_m1(i:i+1,i:i+1)=K_m1(i:i+1,i:i+1)+k_elemnt;
   end

K_m1(1,1)=K_m1(1,1)+C;

%model 2_Rigidity matrix
K_m2(1:end,1:end)=zeros(n);

for i=1:n-1
    k_elemnt=(pi*m/8)*(((4*m-3*i)/(m))^2+((4*m-3*i+3)/(m))^2)*[1 -1;-1 1];
    K_m2(i:i+1,i:i+1)=K_m2(i:i+1,i:i+1)+k_elemnt;
end
K_m2(1,1)=K_m2(1,1)+C;

%Boundary conditions
Q(n)=-1;
Q(1:end-1)=0;



%Resolution
U_m1=K_m1\Q
U_m2=K_m2\Q



