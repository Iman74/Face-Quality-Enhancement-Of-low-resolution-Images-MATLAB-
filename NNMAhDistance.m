
%load all
clear
clc

factor=[4 4];
testclass=25
testangle=4
input_im=66;
series=5;
in=zeros(216,input_im,series);
temp=cell(input_im,series);
%left
for k = 1 : input_im
         a = sprintf('%0.8d.tif', k);
         temp{k,1} = imread(a);
         %factorize
             m=temp{k,1};
            la1=5; 
            lb1=8;
            la2=3;
            lb2=11;
            lc1=13;
            ld1=15;
            lc2=4;
            ld2=9;
            m(la1:lb1,la2:lb2)=m(la1:lb1,la2:lb2)*factor(1);%front eye
            m(lc1:ld1,lc2:ld2)=m(lc1:ld1,lc2:ld2)*factor(1);%front lips
             teampFac{k,1}=m;
         %
         in(:,k,1)=double(teampFac{k,1}(:));
end
%right
for k = 1 : input_im
         a = sprintf('%0.9d.tif', k);
         temp{k,2} = imread(a);
         %factorize
             m=temp{k,2};
            ra1=5; 
            rb1=8;
            ra2=3;
            rb2=11;
            rc1=13;
            rd1=15;
            rc2=5;
            rd2=10;
            m(ra1:rb1,ra2:rb2)=m(ra1:rb1,ra2:rb2)*factor(1);%front eye
            m(rc1:rd1,rc2:rd2)=m(rc1:rd1,rc2:rd2)*factor(1);%front lips
             teampFac{k,2}=m;
         %
         in(:,k,2)=double(teampFac{k,2}(:));
end
%down
for k = 1 : input_im
         a = sprintf('%0.10d.tif', k);
         temp{k,3} = imread(a);
         %factorize
             m=temp{k,3};
            da1=6; 
            db1=9;
            da2=3;
             db2=11;
            dc1=13;
             dd1=15;
        	dc2=5;
             dd2=10;
            m(da1:db1,da2:db2)=m(da1:db1,da2:db2)*factor(1);%front eye
            m(dc1:dd1,dc2:dd2)=m(dc1:dd1,dc2:dd2)*factor(1);%front lips
             teampFac{k,3}=m;
         %
         in(:,k,3)=double(teampFac{k,3}(:));
end
%up
for k = 1 : input_im
         a = sprintf('%0.11d.tif', k);
         temp{k,4} = imread(a);
         %factorize
             m=temp{k,4};
            ua1=5; 
         ub1=8;
         ua2=3;
         ub2=11;
         uc1=13;
         ud1=15;
         uc2=4;
         ud2=10;
            m(ua1:ub1,ua2:ub2)=m(ua1:ub1,ua2:ub2)*factor(1);%front eye
            m(uc1:ud1,uc2:ud2)=m(uc1:ud1,uc2:ud2)*factor(1);%front lips
             teampFac{k,4}=m;
         %
         in(:,k,4)=double(teampFac{k,4}(:));
end
%front
for k = 1 : input_im
         a = sprintf('%0.5d.tif', k);
         temp{k,5} = imread(a);
         %factorize
             m=temp{k,5};
             fa1=5; 
            fb1=8;
            fa2=3;
            fb2=10;
            fc1=13;
            fd1=15;
            fc2=4;
            fd2=9;
         m(fa1:fb1,fa2:fb2)=m(fa1:fb1,fa2:fb2)*factor(1);%front eye
         m(fc1:fd1,fc2:fd2)=m(fc1:fd1,fc2:fd2)*factor(1);%front lips
             teampFac{k,5}=m;
         %
         if (k ==31)
              in(:,k,5)=0;
         else    
             in(:,k,5)=double(teampFac{k,5}(:));
         end
end

%%
%find distances
dataNum=(input_im)*series;
diffrent=zeros(216,dataNum);
distance=zeros(1,dataNum);

for i=1:dataNum
    diffrent(:,i)=mahal(in(:,testclass,testangle),in(:,i));%input image
    %diffrent(:,i)=in(:,testclass,testangle)-in(:,i);%input image
    distance(i)=sum(abs(diffrent(:,i)));
end
distance([0:4]*input_im+testclass)=realmax;
[diff,index]=min(abs(distance));
%%
if (mod(index,input_im) ~=0)
    findClass =mod(index,input_im);
else
    findClass=input_im;
end
findClass
findeAngle =ceil(index/input_im)

testimage=testclass;

a = sprintf('%0.6d.tif', testclass);
test = imread(a);

a = sprintf('%0.6d.tif', findClass);
find = imread(a);
%%
%Error 
PSNR=psnr(find,test)

Valuefactor=[4 4];

hfa1=20;
hfb1=32;
hfa2=10;
hfb2=40;
hfc1=40;
hfd1=52;
hfc2=16;
hfd2=36;

diff1=find(hfa1:hfb1,hfa2:hfb2)-test(hfa1:hfb1,hfa2:hfb2);%eyes
diff2=find(hfc1:hfd1,hfc2:hfd2)-test(hfc1:hfd1,hfc2:hfd2);%lips

%modify find image
dfind=find;
dfind(hfa1:hfb1,hfa2:hfb2)=0; 
dfind(hfc1:hfd1,hfc2:hfd2)=0;
%modify test image
dtest=test;
dtest(hfa1:hfb1,hfa2:hfb2)=0; 
dtest(hfc1:hfd1,hfc2:hfd2)=0;

%imshow (dfind)

diff3=find - test;%other parts

sqdiff1=diff1.^2;
sqdiff2=diff2.^2;
sqdiff3=diff3.^2;

fSum=sum(Valuefactor)+1;
fsqdiff1=(Valuefactor(1)/fSum).*sum(sum(sqdiff1));
fsqdiff2=(Valuefactor(2)/fSum).*sum(sum(sqdiff2));
fsqdiff3=(1/fSum).*sum(sum(sqdiff3));

IBMSE=1/(72*48).*(fsqdiff1+fsqdiff2+fsqdiff3);

IBPSNR = 10*log(255/IBMSE)

%%
figure(3)
subplot(2,2,1)
imshow(temp{testclass,testangle});
title('Orginal LR');
subplot(2,2,2)
imshow(test);
title('Orginal HR');
subplot(2,2,3)
imshow(temp{findClass,findeAngle});
title('Find LR');
subplot(2,2,4)
imshow(find);
title('Find HR');



