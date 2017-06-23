clc;
clear;
[data fs]=audioread('Ba.wav');
len = length(data);
r=input('Enter the value of r\n');
data1 = zeros(floor(r*len)+1,1);
for i=1:len
    if(ceil(r*i)==1)
        data1(1,1)=data(1,1);
        continue;
    end
    if(floor(r*i)==(r*i))
        data1(r*i,1)=data(i,1);
    end
    if(floor(r*i)~=(r*i))
       data1(floor(r*i),1)=data(i,1);
    end
end
for i=2: len
    x1=floor(r*(i-1));
    x3=floor(r*i)-floor(r*(i-1));
    if x3>0
      y1=data1(floor(r*(i-1)),1);
      y2=data1(floor(r*i),1);
      m=(y2-y1)/x3;
    end
    for j=floor(r*(i-1))+1:floor(r*i)-1
        data1(j,1)=y1+m*(j-x1);
    end
end
        
