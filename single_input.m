clc
clear all
%factor=1.5*ones(9);
factor=[5 5];
%IBPSNR
Valuefactor=[4 4];

inputnum=30;
imagenum=29;
front = cell(1,31);
frontc=cell(1,31);
frontorg=cell(1,31);
v=zeros(216,1);
vorg=zeros(216,1);
mul=1.01;
plus=1;
  for k = 1 : 31
         a = sprintf('%5.11d.tif', k);
         FRONT{k} = imread(a);
         for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=FRONT{k};
                 v(m:n,1)=uc(:,i);
             end
                 vorg=v;
         
         m=FRONT{k};
         a1=5; 
         b1=8;
         a2=3;
         b2=11;
         c1=13;
         d1=15;
         c2=4;
         d2=10;
         m(a1:b1,a2:b2)=m(a1:b1,a2:b2)*factor(1);%front eye
         m(c1:d1,c2:d2)=m(c1:d1,c2:d2)*factor(2);%front lips
         FRONTfac{k}=m;
         
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=FRONTfac{k};
                 v(m:n,1)=uc(:,i);
             end
                 
                   
%               for i=23:33 
%                     v(i,1)=factor(1)*v(i,1);
%              end
%              
%              for i=41:51 
%                     v(i,1)=factor(2)*v(i,1);
%              end
%              
%              for i=59:69 
%                     v(i,1)=factor(3)*v(i,1);
%              end
%              
%              for i=77:87 
%                     v(i,1)=factor(4)*v(i,1);
%              end
%              
%              for i=95:105 
%                     v(i,1)=factor(5)*v(i,1);
%              end
%              
%              for i=103:113 
%                     v(i,1)=factor(6)*v(i,1);
%              end
%              
%              for i=121:131 
%                     v(i,1)=factor(7)*v(i,1);
%              end
%              
%              for i=139:149 
%                     v(i,1)=factor(8)*v(i,1);
%              end
%              
%              for i=157:167 
%                     v(i,1)=factor(9)*v(i,1);
%              end
      FRONTC{k}=v;
      FRONTORG{k}=vorg;
  end
  

  k=1;
  fac=1.5;
  z=FRONTC{k}-FRONTORG{k};
z=z.*fac(1)/(fac(1)-1);
  
  diff=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     diff(:,i)=z(m:n,1);
end
diffu=uint8(diff);
%figure (10)
imshow(diffu);
  
  %%
inpi=FRONTC{inputnum}*mul+plus;
tmp=0;
for i=1:imagenum
    for j=1:imagenum
       % if(i ~=inputnum &&j ~=inputnum)
            imi=FRONTC{i};
            imj=FRONTC{j};
            Sum=(inpi-imi)'*(inpi-imj);
            tmp=tmp+(1/Sum);
       % end
    end
end
denominator=tmp;
 tmp=0;
 w=zeros(imagenum,1);
for i=1:imagenum
    for j=1:imagenum
       % if(i ~=inputnum &&j ~=inputnum)
            imi=FRONTC{i};
            imj=FRONTC{j};
            Sum=(inpi-imi)'*(inpi-imj);
            tmp=tmp+(1/Sum);
       % end
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:imagenum
   % if(i ~=inputnum )
        vec=FRONTORG{i};
        ans=ans+w(i,1)*vec;
    %end
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{inputnum};
%HR to Vector
fronthr = cell(1,31);
fronthrc=cell(1,31);  
v=zeros(3456,1);
  for k = 1 : 31
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
      FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{inputnum};

ansh=zeros(3456,1);
for i=1:imagenum
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
orgh=FRONTHR{inputnum};
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);


%up
uphr = cell(1,31);
uphrc=cell(1,31);  
v=zeros(3456,1);
 for k = 1 : 31
         a = sprintf('%2.2d.tif', k);
         UPHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=UPHR{k};
                 v(m:n,1)=uc(:,i);
             end
      UPHRC{k}=v;
  end
  
inpihup=UPHRC{inputnum};

anshup=zeros(3456,1);
for i=1:imagenum
    vec=UPHRC{i};
    anshup=anshup+w(i,1)*vec;
end

ansihup=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihup(:,i)=anshup(m:n,1);
end


orghup=UPHR{inputnum};
org=FRONT{inputnum};

orghuintup=uint8(orghup);
orguintup=uint8(org);
%ansiuintup=uint8(ansiup);
ansihuintup=uint8(ansihup);

%down

downhr = cell(1,31);
downhrc=cell(1,31);  
v=zeros(3456,1);
  for k = 1 : 31
         a = sprintf('%3.3d.tif', k);
         DOWNHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNHR{k};
                 v(m:n,1)=uc(:,i);
             end
      DOWNHRC{k}=v;
  end
  
inpihdown=DOWNHRC{31};

anshdown=zeros(3456,1);
for i=1:imagenum
    vec=DOWNHRC{i};
    anshdown=anshdown+w(i,1)*vec;
end

ansihdown=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdown(:,i)=anshdown(m:n,1);
end
orghdown=DOWNHR{inputnum};
orghuintdown=uint8(orghdown);
orguintdown=uint8(org);
% ansiuintdown=uint8(ansidown);
ansihuintdown=uint8(ansihdown);


% %left
lefthr = cell(1,31);
lefthrc=cell(1,31);  
v=zeros(3456,1);
  for k = 1 : 31
         a = sprintf('%4.4d.tif', k);
         LEFTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTHR{k};
                 v(m:n,1)=uc(:,i);
             end
      LEFTHRC{k}=v;
  end
  
inpihleft=LEFTHRC{inputnum};

anshleft=zeros(3456,1);
for i=1:imagenum
    vec=LEFTHRC{i};
    anshleft=anshleft+w(i,1)*vec;
end

ansihleft=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihleft(:,i)=anshleft(m:n,1);
end
orghleft=LEFTHR{inputnum};
orghuintleft=uint8(orghleft);
orguintleft=uint8(org);
% ansiuintleft=uint8(ansileft);
ansihuintleft=uint8(ansihleft);

%right

righthr = cell(1,31);
righthrc=cell(1,31);  
v=zeros(3456,1);
  for k = 1 : 31
         a = sprintf('%7.7d.tif', k);
         RIGHTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTHR{k};
                 v(m:n,1)=uc(:,i);
             end
      RIGHTHRC{k}=v;
  end
  
inpihright=FRONTHRC{inputnum};

anshright=zeros(3456,1);
for i=1:imagenum
    vec=RIGHTHRC{i};
    anshright=anshright+w(i,1)*vec;
end

ansihright=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihright(:,i)=anshright(m:n,1);
end
orghright=RIGHTHR{inputnum};
orghuintright=uint8(orghright);
orguintright=uint8(org);
% ansiuintright=uint8(ansiright);
ansihuintright=uint8(ansihright);


%plot

%BWC = imadjust(ansihuint);
%orguintright=imadjust(orguintright);
%BWS = edge(ansihuint,'sobel');
%%
%Error 
find=ansihuint;
test=orghuint;

PSNR=psnr(find,test)

%Valuefactor=[1 1];

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
figure(1)
subplot(2,2,3)
imshow(orghuint);
title('Orginal HR');
subplot(2,2,1)
imshow(orguint);
title('Input LR')
subplot(2,2,4)
imshow(ansihuint);
title('Reconstructed HR');
subplot(2,2,2)
imshow(ansiuint);
title('Recontructed LR');
%%
figure(2)
subplot(2,2,3)
imshow(orghuintup);
title('Orginal HR');
subplot(2,2,1)
imshow(orguintup);
title('Input LR')
subplot(2,2,4)
imshow(ansihuintup);
title('Reconstructed HR');
subplot(2,2,2)
%imshow(ansiuintright);
title('Recontructed LR');

figure(3)
subplot(2,2,3)
imshow(orghuintdown);
title('Orginal HR');
subplot(2,2,1)
imshow(orguintdown);
title('Input LR')
subplot(2,2,4)
imshow(ansihuintdown);
title('Reconstructed HR');
subplot(2,2,2)
%imshow(ansiuintright);
title('Recontructed LR');

figure(4)
subplot(2,2,3)
imshow(orghuintleft);
title('Orginal HR');
subplot(2,2,1)
imshow(orguintleft);
title('Input LR')
subplot(2,2,4)
imshow(ansihuintleft);
title('Reconstructed HR');
subplot(2,2,2)
%imshow(ansiuintright);
title('Recontructed LR');

figure(5)
subplot(2,2,3)
imshow(orghuintright);
title('Orginal HR');
subplot(2,2,1)
imshow(orguintright);
title('Input LR')
subplot(2,2,4)
imshow(ansihuintright);
title('Reconstructed HR');
subplot(2,2,2)
%imshow(ansiuintright);
title('Recontructed LR');

 %subplot(1,3,1)
 %imshow(orguint);
 %title('Input LR')
 
% subplot(1,3,2)
 %imshow(ansihuint);
% title('Reconstructed HR Front');
 
 %subplot(1,3,3)
 %imshow(orghuint);
 %title('Orginal HR');
