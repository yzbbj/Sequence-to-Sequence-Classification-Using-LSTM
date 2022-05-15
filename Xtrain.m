%%Create train set(data)

function xx=Xtrain(c)

    A1=load('97.mat');
    B1=struct2cell(A1);%normal
    A2=load('105.mat');
    B2=struct2cell(A2);%inner
    A3=load('118.mat');
    B3=struct2cell(A3);%roll
    A4=load('130.mat');
    B4=struct2cell(A4);%outer
    
    C1=B1{1,1};
    D1=B1{2,1};
    C2=B2{1,1};
    D2=B2{2,1};
    C3=B3{1,1};
    D3=B3{2,1};
    C4=B4{1,1};
    D4=B4{2,1};
    
    E1=[C1(1:2000,:)'
        D1(1:2000,:)'];%normal
    E2=[C1(1:1000,:)',C2(1:1000,:)'
        D1(1:1000,:)',D2(1:1000,:)'];%normal¡úinner
    E3=[C1(1:1000,:)',C3(1:1000,:)'
        D1(1:1000,:)',D3(1:1000,:)'];%normal¡úroll   
    E4=[C1(1:1000,:)',C4(1:1000,:)'
        D1(1:1000,:)',D4(1:1000,:)'];%normal¡úouter  
 
    x1={};
    x2={};
    x3={};
    x4={};
    
    x1=[x1
        E1];
    x2=[x2
        E2];
    x3=[x3
        E3];
    x4=[x4
        E4];
    
    xx=[x1
    x2
    x3
    x4];


