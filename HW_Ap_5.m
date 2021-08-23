clear all
clc
close all



n=input('Give the number of nodes:');
m=n-1;%number of elemnts

Q=sym('Q',[n,1]);
U_m1=sym('U',[n,1]);
U_m2=sym('U',[n,1]);

%model_1_Rigidity matrix
K_m1=zeros(n);

for i=1:n-1
    k_elemnt=(pi*m/12)*(((4*m-3*i)/(m))^2+((4*m-3*i)/(m))*((4*m-3*i+3)/(m))+((4*m-3*i+3)/(m))^2)*[1 -1;-1 1];
    K_m1(i:i+1,i:i+1)=K_m1(i:i+1,i:i+1)+k_elemnt;
   
end

%Boundary conditions
Q(n)=-1;
Q(2:end-1)=0;
U_m1(1)=0;
U_m2(1)=0;


%model_2_Rigidity matrix
K_m2=zeros(n);
for i=1:n-1
    k_elemnt=(pi*m/8)*(((4*m-3*i)/(m))^2+((4*m-3*i+3)/(m))^2)*[1 -1;-1 1];
    K_m2(i:i+1,i:i+1)=K_m2(i:i+1,i:i+1)+k_elemnt;
end

%Resolution
U_m1(2:end)=K_m1(2:end,2:end)\Q(2:end)
U_m2(2:end)=K_m2(2:end,2:end)\Q(2:end)
