A=[1 1 ; 2 1 ; 3 1];
b=[1;2;2];
C=A;
[B,K]=size(A);
A_T=zeros(K,B);
for U1= 1 : K
    for U2= 1 : B
        A_T(U1,U2)= A(U2,U1);
    end
end
H=A_T*A;
[N,N]=size(H);
if N==2
        Adj_Matrix=[H(2,2) -1*H(1,2); -1*H(2,1) H(1,1)];
        DET_= (H(1,1)*H(2,2))-(H(1,2)*H(2,1));
            Inverse=(1/DET_)*Adj_Matrix;
else if N==3
 cofactor=zeros(N,N);
for U1=1 : N
    for U2=1 : N
        H;
        H(U1,:)=[];
        H(:,U2)=[];
        cofactor(U1,U2)=((-1)^(U1+U2))*((H(1,1)*H(2,2))-((H(1,2)*H(2,1))));
    end
end
 adj_Matrix=cofactor';
Det=0;
for K=1:N
    Det=Det+cofactor(1,K)*H(1,K);
end
Inverse=(1/Det)*adj_Matrix;
    end
end
L=A_T*b;
X_Aprox=Inverse*L;
P=C*X_Aprox;         %Proyeksi vektor c ke bidang A
e=b-P;
cek1=round(P'*e);
if cek1 == 0
   fprintf ('Solusi terdekat dari persamaan AX=b diatas yaitu dapat diperoleh ketika :\n'); 
   X_Aprox
   fprintf ('Vektor e tegak lurus (Orthogonal) dengan bidang A \n'); 
end
