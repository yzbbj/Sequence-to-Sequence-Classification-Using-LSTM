%%Create train set(label)

function yy=Ytrain(c)
 x=Xtrain(1);
 n=numel(x);
 y=cell(4,1);
 
 for i=1:n
     a=x(i);
     a=cell2mat(a);
     a=numel(a)/2;
     y(i)={a};
 end
 
 
 y1=cell(1,y{1});
 for i1=1:y{1}
        y1(1,i1)={1};
 end
    y1=cell2mat(y1);
    y1=categorical(y1);%normal
    

    y2=cell(1,y{2});
    for i1=1:y{2}/2
        y2(1,i1)={1};
    end
    
    for i1=y{2}/2+1:y{2}
        y2(1,i1)={2};
    end
    y2=cell2mat(y2);
    y2=categorical(y2);%normal¡úinner

    y3=cell(1,y{3});
    for i1=1:y{3}/2
        y3(1,i1)={1};
    end
    
    for i1=y{3}/2+1:y{3}
        y3(1,i1)={3};
    end
    y3=cell2mat(y3);
    y3=categorical(y3);%normal¡úroll   

    
    y4=cell(1,y{4});
    for i1=1:y{4}/2
        y4(1,i1)={1};
    end
    for i1=y{4}/2+1:y{4}
        y4(1,i1)={4};
    end
    y4=cell2mat(y4);
    y4=categorical(y4);%normal¡úouter  
    
yy={y1
    y2
    y3
    y4};

