clear
clc
%% Initialization
input_im=66;
test_im=66;
train_im=66;
front = cell(1,input_im);
frontc=cell(1,input_im);
frontw=cell(1,input_im);
frontdif = cell(1,input_im);
eye=cell(1,input_im);
ey=zeros(24,1);
lip=cell(1,input_im);
li=zeros(24,1);
fac=zeros(168,1);
face=cell(input_im,1);
fullfacelr=zeros(18,12);
v=zeros(216,1);
difv=zeros(216,1);
vector=zeros(216,1);
count=0;
im_hr_fr1=zeros(72,48);
im_hr_ri1=zeros(72,48);
im_hr_lef1=zeros(72,48);
im_hr_up1=zeros(72,48);
im_hr_do1=zeros(72,48);

im_hr_fr2=zeros(72,48);
im_hr_ri2=zeros(72,48);
im_hr_lef2=zeros(72,48);
im_hr_up2=zeros(72,48);
im_hr_do2=zeros(72,48);
%right
rightlr=cell(1,input_im);
rightdif=cell(1,input_im);
rightc=cell(1,input_im);
eyeright=cell(1,input_im);
lipright=cell(1,input_im);
elseright=cell(1,input_im);
%left
leftlr=cell(1,input_im);
leftdif=cell(1,input_im);
leftc=cell(1,input_im);
eyeleft=cell(1,input_im);
lipleft=cell(1,input_im);
elseleft=cell(1,input_im);
%up
uplr=cell(1,input_im);
updif=cell(1,input_im);
upc=cell(1,input_im);
eyeup=cell(1,input_im);
lipup=cell(1,input_im);
elseup=cell(1,input_im);
%down
downlr=cell(1,input_im);
downdif=cell(1,input_im);
downc=cell(1,input_im);
eyedown=cell(1,input_im);
lipdown=cell(1,input_im);
elsedown=cell(1,input_im);

factor=input('Importance factor?\n')
%% vectorize inputs
%front
  for k = 1 : input_im
         a = sprintf('%5.5d.tif', k);
         FRONT{k} = imread(a);
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=FRONT{k};
                 v(m:n,1)=uc(:,i);
             end
       %vector of eyes
       for i=1:8
           ey(3*i-2:3*i,1)=v((i+1)*18+6:(i+1)*18+8,1); 
       end
       %vector of lips
        for i=1:8
           li(3*i-2:3*i,1)=v((i+1)*18+11:(i+1)*18+13,1); 
        end
        fac(1:36 ,1)=v(1:36,1);
        fac(133:168,1)=v(181:216,1);
          for i=1:8
              fac(37+(i-1)*12:41+(i-1)*12,1)=v(37+(i-1)*18:41+(i-1)*18,1);
              fac(42+(i-1)*12:43+(i-1)*12,1)=v(45+(i-1)*18:46+(i-1)*18,1);
              fac(44+(i-1)*12:48+(i-1)*12,1)=v(50+(i-1)*18:54+(i-1)*18,1);
          end
       
       %diffrent coeficient
       for i=23:33 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=41:51 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=59:69 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=77:87 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=95:105 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=103:113 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=121:131 ;
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=139:149 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=157:167 
                    difv(i,1)=factor*v(i,1);
             end
             
      FRONTDIF{k}=difv;
      FRONTC{k}=v;
      EYE{k}=ey;
      LIP{k}=li;
      FACE{k}=fac;
  end
  %right
  for k = 1 : input_im
         a = sprintf('%8.8d.tif', k);
         RIGHTLR{k} = imread(a);
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=RIGHTLR{k};
                 v(m:n,1)=uc(:,i);
             end
       %vector of eyes
       for i=1:8
           ey(3*i-2:3*i,1)=v((i+1)*18+6:(i+1)*18+8,1); 
       end
       %vector of lips
        for i=1:8
           li(3*i-2:3*i,1)=v((i+1)*18+11:(i+1)*18+13,1); 
        end
        fac(1:36 ,1)=v(1:36,1);
        fac(133:168,1)=v(181:216,1);
          for i=1:8
              fac(37+(i-1)*12:41+(i-1)*12,1)=v(37+(i-1)*18:41+(i-1)*18,1);
              fac(42+(i-1)*12:43+(i-1)*12,1)=v(45+(i-1)*18:46+(i-1)*18,1);
              fac(44+(i-1)*12:48+(i-1)*12,1)=v(50+(i-1)*18:54+(i-1)*18,1);
          end
       
       %diffrent coeficient
       for i=23:33 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=41:51 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=59:69 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=77:87 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=95:105 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=103:113 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=121:131 ;
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=139:149 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=157:167 
                    difv(i,1)=factor*v(i,1);
             end
             
      RIGHTDIF{k}=difv;
      RIGHTC{k}=v;
      EYERIGHT{k}=ey;
      LIPRIGHT{k}=li;
      ELSERIGHT{k}=fac;
  end
   %left
  for k = 1 : input_im
         a = sprintf('%9.9d.tif', k);
         LEFTLR{k} = imread(a);
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=LEFTLR{k};
                 v(m:n,1)=uc(:,i);
             end
            
       %vector of eyes
       for i=1:8
           ey(3*i-2:3*i,1)=v((i+1)*18+6:(i+1)*18+8,1); 
       end
       %vector of lips
        for i=1:8
           li(3*i-2:3*i,1)=v((i+1)*18+11:(i+1)*18+13,1); 
        end
        fac(1:36 ,1)=v(1:36,1);
        fac(133:168,1)=v(181:216,1);
          for i=1:8
              fac(37+(i-1)*12:41+(i-1)*12,1)=v(37+(i-1)*18:41+(i-1)*18,1);
              fac(42+(i-1)*12:43+(i-1)*12,1)=v(45+(i-1)*18:46+(i-1)*18,1);
              fac(44+(i-1)*12:48+(i-1)*12,1)=v(50+(i-1)*18:54+(i-1)*18,1);
          end
       
       %diffrent coeficient
       for i=23:33 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=41:51 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=59:69 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=77:87 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=95:105 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=103:113 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=121:131 ;
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=139:149 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=157:167 
                    difv(i,1)=factor*v(i,1);
             end
             
      LEFTDIF{k}=difv;
      LEFTC{k}=v;
      EYELEFT{k}=ey;
      LIPLEFT{k}=li;
      ELSELEFT{k}=fac;
  end
   %up
  for k = 1 : input_im
         a = sprintf('%11.11d.tif', k);
         UPLR{k} = imread(a);
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=UPLR{k};
                 v(m:n,1)=uc(:,i);
             end
       %vector of eyes
       for i=1:8
           ey(3*i-2:3*i,1)=v((i+1)*18+6:(i+1)*18+8,1); 
       end
       %vector of lips
        for i=1:8
           li(3*i-2:3*i,1)=v((i+1)*18+11:(i+1)*18+13,1); 
        end
        fac(1:36 ,1)=v(1:36,1);
        fac(133:168,1)=v(181:216,1);
          for i=1:8
              fac(37+(i-1)*12:41+(i-1)*12,1)=v(37+(i-1)*18:41+(i-1)*18,1);
              fac(42+(i-1)*12:43+(i-1)*12,1)=v(45+(i-1)*18:46+(i-1)*18,1);
              fac(44+(i-1)*12:48+(i-1)*12,1)=v(50+(i-1)*18:54+(i-1)*18,1);
          end
       
       %diffrent coeficient
       for i=23:33 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=41:51 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=59:69 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=77:87 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=95:105 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=103:113 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=121:131 ;
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=139:149 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=157:167 
                    difv(i,1)=factor*v(i,1);
             end
             
      UPDIF{k}=difv;
      UPC{k}=v;
      EYEUP{k}=ey;
      LIPUP{k}=li;
      ELSEUP{k}=fac;
  end
   %down
  for k = 1 : input_im
         a = sprintf('%10.10d.tif', k);
         DOWNLR{k} = imread(a);
             for i=1:12
                 m=(i-1)*18+1;
                 n=m+17;
                 uc=DOWNLR{k};
                 v(m:n,1)=uc(:,i);
             end
       %vector of eyes
       for i=1:8
           ey(3*i-2:3*i,1)=v((i+1)*18+6:(i+1)*18+8,1); 
       end
       %vector of lips
        for i=1:8
           li(3*i-2:3*i,1)=v((i+1)*18+11:(i+1)*18+13,1); 
        end
        fac(1:36 ,1)=v(1:36,1);
        fac(133:168,1)=v(181:216,1);
          for i=1:8
              fac(37+(i-1)*12:41+(i-1)*12,1)=v(37+(i-1)*18:41+(i-1)*18,1);
              fac(42+(i-1)*12:43+(i-1)*12,1)=v(45+(i-1)*18:46+(i-1)*18,1);
              fac(44+(i-1)*12:48+(i-1)*12,1)=v(50+(i-1)*18:54+(i-1)*18,1);
          end
       
       %diffrent coeficient
       for i=23:33 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=41:51 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=59:69 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=77:87 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=95:105 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=103:113 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=121:131 ;
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=139:149 
                    difv(i,1)=factor*v(i,1);
             end
             
             for i=157:167 
                    difv(i,1)=factor*v(i,1);
             end
             pose=2;
      DOWNDIF{k}=difv;
      DOWNC{k}=v;
      EYEDOWN{k}=ey;
      LIPDOWN{k}=li;
      ELSEDOWN{k}=fac;
  end
    %% select input LR pose
  %Diffrent Coefficient Method
  %% front
if pose==1
  inpdif=FRONTDIF{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        difi=FRONTDIF{i};
        difj=FRONTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
if var(W)<25/train_im ^ 2
    image_left=tsetfunc(W(1));
end
 wdif=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        difi=FRONTDIF{i};
        difj=FRONTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
    wdif(i,1)=tmp/denominator;
    tmp=0;
end

%right hr diff method pose 1
rightdifhr = cell(1,input_im);
rightdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%7.7d.tif', k);
         RIGHTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      RIGHTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=RIGHTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=RIGHTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
rightdifmethod=imagedifco;
imagedifco=0;

%left hr diff method pose 1

leftdifhr = cell(1,input_im);
leftdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%4.4d.tif', k);
         LEFTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      LEFTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=LEFTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=LEFTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
leftdifmethod=imagedifco;
imagedifco=0;

%front hr diff method pose 1

frontdifhr = cell(1,input_im);
frontdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      FRONTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=FRONTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=FRONTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
frontdifmethod=imagedifco;
imagedifco=0;

%up hr diff method pose 1

updifhr = cell(1,input_im);
updifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%2.2d.tif', k);
         UPDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=UPDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      UPDIFHRC{k}=vdifhr;
  end
  
inpihdiff=UPDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=UPDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
updifmethod=imagedifco;
imagedifco=0;

%down hr diff method pose 1

downdifhr = cell(1,input_im);
downdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%3.3d.tif', k);
         DOWNDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      DOWNDIFHRC{k}=vdifhr;
  end
  
inpihdiff=DOWNDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=DOWNDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
downdifmethod=imagedifco;
imagedifco=0;

 %paper method pose1
inpi=FRONTC{test_im}+1;
tmp=0;
 w=zeros(train_im,1);
 for i=1:train_im
    for j=1:train_im
        imi=FRONTC{i};
        imj=FRONTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
 end
denominator=tmp;
 tmp=0;
for i=1:train_im
    for j=1:train_im
        imi=FRONTC{i};
        imj=FRONTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:train_im
    vec=FRONTC{i};
    ans=ans+w(i,1)*vec;
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{test_im}+1;

ans=zeros(72,48);

for i=1:train_im
   
    FRONTDIFHR{i}=im2double(FRONTDIFHR{i});
    ans=ans+w(i,1)*FRONTDIFHR{i};
end
im_hr_fr1=ans;

ans=zeros(72,48);
for i=1:train_im
    RIGHTDIFHR{i}=im2double(RIGHTDIFHR{i});
    ans=ans+w(i,1)*RIGHTDIFHR{i};
end
im_hr_ri1=ans;

ans=zeros(72,48);
for i=1:train_im
    LEFTDIFHR{i}=im2double(LEFTDIFHR{i});
    ans=ans+w(i,1)*LEFTDIFHR{i};
end
im_hr_lef1=ans;

ans=zeros(72,48);
for i=1:train_im
    UPDIFHR{i}=im2double(UPDIFHR{i});
    ans=ans+w(i,1)*UPDIFHR{i};
end
im_hr_up1=ans;

ans=zeros(72,48);
for i=1:train_im
    DOWNDIFHR{i}=im2double(DOWNDIFHR{i});
    ans=ans+w(i,1)*DOWNDIFHR{i};
end
im_hr_do1=ans;
%lip as vector pose 1
lipinp=LIP{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wlip=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
    wlip(i,1)=tmp/denominator;
    tmp=0;
end

anslip=zeros(24,1);
for i=1:train_im
    lipvec=LIP{i};
    anslip=anslip+wlip(i,1)*lipvec;
end

%eye as vector pose 1
eyeinp=EYE{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        eyei=EYE{i};
        eyej=EYE{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 weye=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        eyei=EYE{i};
        eyej=EYE{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
    weye(i,1)=tmp/denominator;
    tmp=0;
end

anseye=zeros(24,1);
for i=1:train_im
    eyevec=EYE{i};
    anseye=anseye+weye(i,1)*eyevec;
end

%else as vector pose 1
faceinp=FACE{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wface=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
    wface(i,1)=tmp/denominator;
    tmp=0;
end

ansface=zeros(168,1);
for i=1:train_im
    facevec=FACE{i};
    anseye=ansface+wface(i,1)*facevec;
end

%constructing HR partialy head pose
fronthr = cell(1,input_im);
fronthrc=cell(1,input_im);  
v=zeros(3456,1);
eyh=zeros(384,1);
lih=zeros(384,1);
fach=zeros(2688,1);
eyeh=cell(1,input_im);
liph=cell(1,input_im);
faceh=cell(1,input_im);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
             %vector of eyes HR

       for i=1:32
           eyh(12*i-11:12*i,1)=v((i-1)*72+597:(i-1)*72+608,1); 
       end 
       %vector of lips
        for i=1:32
            lih(12*i-11:12*i,1)=v((i-1)*72+617:(i-1)*72+628,1);
        end
        %vector else
        fach(1:576,1)=v(1:576,1);
        fach(2113:2688,1)=v(2881:3456,1);
         for i=1:32
              fach(577+(i-1)*48:596+(i-1)*48,1)=v(577+(i-1)*72:596+(i-1)*72,1);
              fach(597+(i-1)*48:604+(i-1)*48,1)=v(609+(i-1)*72:616+(i-1)*72,1);
              fach(605+(i-1)*48:624+(i-1)*48,1)=v(629+(i-1)*72:648+(i-1)*72,1);
         end
          LIPH{k}=lih;
          EYEH{k}=eyh;
          FACEH{k}=fach;
          FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{test_im}+1;

ansh=zeros(3456,1);
for i=1:train_im
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
%lip reconstruct
lipih=LIP{test_im}+1;

ansliph=zeros(384,1);
for i=1:train_im
    veclip=LIPH{i};
    ansliph=ansliph+wlip(i,1)*veclip;
end
%eye reconstruct
eyeih=EYE{test_im}+1;
anseyeh=zeros(384,1);
for i=1:train_im
    veceye=EYEH{i};
    anseyeh=anseyeh+weye(i,1)*veceye;
end
%face reconstruct

ansfaceh=zeros(2688,1);
for i=1:train_im
    vecface=FACEH{i};
    ansfaceh=ansfaceh+wface(i,1)*vecface;
end

%put diffrent part in their place
recpart=zeros(3456,1);
 for i=1:32
           recpart((i-1)*72+597:(i-1)*72+608,1)=anseyeh(12*i-11:12*i,1);
 end
     
 for i=1:32
           recpart((i-1)*72+617:(i-1)*72+628,1)=ansliph(12*i-11:12*i,1);
 end
        
         recpart(1:576,1)=ansfaceh(1:576,1);
         recpart(2881:3456,1)=ansfaceh(2113:2688,1); 
        
         for i=1:32
              recpart(577+(i-1)*72:596+(i-1)*72,1)=ansfaceh(577+(i-1)*48:596+(i-1)*48,1);
              recpart(609+(i-1)*72:616+(i-1)*72,1)=ansfaceh(597+(i-1)*48:604+(i-1)*48,1);
              recpart(629+(i-1)*72:648+(i-1)*72,1)=ansfaceh(605+(i-1)*48:624+(i-1)*48,1);
         end

        recpartimage=zeros(72,48);
        
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     recpartimage(:,i)=recpart(m:n,1);
end
orgh=FRONTHR{test_im}+1;
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);

recpartimuint=uint8(recpartimage);
end

%% right
if pose==2
  inpdif=RIGHTDIF{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        difi=RIGHTDIF{i};
        difj=RIGHTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wdif=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        difi=RIGHTDIF{i};
        difj=RIGHTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
    wdif(i,1)=tmp/denominator;
    tmp=0;
end
%right HR diff method pose 2
rightdifhr = cell(1,input_im);
rightdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%7.7d.tif', k);
         RIGHTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      RIGHTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=RIGHTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=RIGHTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
rightdifmethod=imagedifco;
imagedifco=0;

%left HR diff method pose 2

leftdifhr = cell(1,input_im);
leftdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%4.4d.tif', k);
         LEFTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      LEFTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=LEFTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=LEFTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
leftdifmethod=imagedifco;
imagedifco=0;

%front HR diff method pose 2
frontdifhr = cell(1,input_im);
frontdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      FRONTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=FRONTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=FRONTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
frontdifmethod=imagedifco;
imagedifco=0;

%up HR diff method pose 2

updifhr = cell(1,input_im);
updifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%2.2d.tif', k);
         UPDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=UPDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      UPDIFHRC{k}=vdifhr;
  end
  
inpihdiff=UPDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=UPDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
updifmethod=imagedifco;
imagedifco=0;

%down HR diff method pose 2

downdifhr = cell(1,input_im);
downdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%3.3d.tif', k);
         DOWNDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      DOWNDIFHRC{k}=vdifhr;
  end
  
inpihdiff=DOWNDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=DOWNDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
downdifmethod=imagedifco;
imagedifco=0;
 %paper method pose2 
inpi=RIGHTC{test_im}+1;
tmp=0;
 w=zeros(train_im,1);
 for i=1:train_im
    for j=1:train_im
        imi=RIGHTC{i};
        imj=RIGHTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
 end
denominator=tmp;
 tmp=0;
for i=1:train_im
    for j=1:train_im
        imi=RIGHTC{i};
        imj=RIGHTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:train_im
    vec=FRONTC{i};
    ans=ans+w(i,1)*vec;
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{test_im}+1;

ans=zeros(72,48);

for i=1:train_im
   
    FRONTDIFHR{i}=im2double(FRONTDIFHR{i});
    ans=ans+w(i,1)*FRONTDIFHR{i};
end
im_hr_fr1=ans;

ans=zeros(72,48);
for i=1:train_im
    RIGHTDIFHR{i}=im2double(RIGHTDIFHR{i});
    ans=ans+w(i,1)*RIGHTDIFHR{i};
end
im_hr_ri1=ans;

ans=zeros(72,48);
for i=1:train_im
    LEFTDIFHR{i}=im2double(LEFTDIFHR{i});
    ans=ans+w(i,1)*LEFTDIFHR{i};
end
im_hr_lef1=ans;

ans=zeros(72,48);
for i=1:train_im
    UPDIFHR{i}=im2double(UPDIFHR{i});
    ans=ans+w(i,1)*UPDIFHR{i};
end
im_hr_up1=ans;

ans=zeros(72,48);
for i=1:train_im
    DOWNDIFHR{i}=im2double(DOWNDIFHR{i});
    ans=ans+w(i,1)*DOWNDIFHR{i};
end
im_hr_do1=ans;
%partialy reconstructed method pose 2
%lip as vector pose 2
lipinp=LIPRIGHT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        lipi=LIPRIGHT{i};
        lipj=LIPRIGHT{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wlip=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
    wlip(i,1)=tmp/denominator;
    tmp=0;
end

anslip=zeros(24,1);
for i=1:train_im
    lipvec=LIP{i};
    anslip=anslip+wlip(i,1)*lipvec;
end

%eye as vector pose 2
eyeinp=EYERIGHT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        eyei=EYERIGHT{i};
        eyej=EYERIGHT{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 weye=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        eyei=EYERIGHT{i};
        eyej=EYERIGHT{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
    weye(i,1)=tmp/denominator;
    tmp=0;
end

anseye=zeros(24,1);
for i=1:train_im
    eyevec=EYE{i};
    anseye=anseye+weye(i,1)*eyevec;
end

%else as vector
faceinp=ELSERIGHT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wface=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        facei=ELSERIGHT{i};
        facej=ELSERIGHT{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
    wface(i,1)=tmp/denominator;
    tmp=0;
end

ansface=zeros(168,1);
for i=1:train_im
    facevec=ELSERIGHT{i};
    anseye=ansface+wface(i,1)*facevec;
end


%constructing HR partialy head pose
fronthr = cell(1,input_im);
fronthrc=cell(1,input_im);  
v=zeros(3456,1);
eyh=zeros(384,1);
lih=zeros(384,1);
fach=zeros(2688,1);
eyeh=cell(1,input_im);
liph=cell(1,input_im);
faceh=cell(1,input_im);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
             %vector of eyes HR

       for i=1:32
           eyh(12*i-11:12*i,1)=v((i-1)*72+597:(i-1)*72+608,1); 
       end 
       %vector of lips
        for i=1:32
            lih(12*i-11:12*i,1)=v((i-1)*72+617:(i-1)*72+628,1);
        end
        %vector else
        fach(1:576,1)=v(1:576,1);
        fach(2113:2688,1)=v(2881:3456,1);
         for i=1:32
              fach(577+(i-1)*48:596+(i-1)*48,1)=v(577+(i-1)*72:596+(i-1)*72,1);
              fach(597+(i-1)*48:604+(i-1)*48,1)=v(609+(i-1)*72:616+(i-1)*72,1);
              fach(605+(i-1)*48:624+(i-1)*48,1)=v(629+(i-1)*72:648+(i-1)*72,1);
         end
          LIPH{k}=lih;
          EYEH{k}=eyh;
          FACEH{k}=fach;
          FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{test_im}+1;

ansh=zeros(3456,1);
for i=1:train_im
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
%lip reconstruct
lipih=LIP{test_im}+1;

ansliph=zeros(384,1);
for i=1:train_im
    veclip=LIPH{i};
    ansliph=ansliph+wlip(i,1)*veclip;
end
%eye reconstruct
eyeih=EYE{test_im}+1;
anseyeh=zeros(384,1);
for i=1:train_im
    veceye=EYEH{i};
    anseyeh=anseyeh+weye(i,1)*veceye;
end
%face reconstruct

ansfaceh=zeros(2688,1);
for i=1:train_im
    vecface=FACEH{i};
    ansfaceh=ansfaceh+wface(i,1)*vecface;
end

%put diffrent part in their place
recpart=zeros(3456,1);
 for i=1:32
           recpart((i-1)*72+597:(i-1)*72+608,1)=anseyeh(12*i-11:12*i,1);
 end
     
 for i=1:32
           recpart((i-1)*72+617:(i-1)*72+628,1)=ansliph(12*i-11:12*i,1);
 end
        
         recpart(1:576,1)=ansfaceh(1:576,1);
         recpart(2881:3456,1)=ansfaceh(2113:2688,1); 
        
         for i=1:32
              recpart(577+(i-1)*72:596+(i-1)*72,1)=ansfaceh(577+(i-1)*48:596+(i-1)*48,1);
              recpart(609+(i-1)*72:616+(i-1)*72,1)=ansfaceh(597+(i-1)*48:604+(i-1)*48,1);
              recpart(629+(i-1)*72:648+(i-1)*72,1)=ansfaceh(605+(i-1)*48:624+(i-1)*48,1);
         end

        recpartimage=zeros(72,48);
        
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     recpartimage(:,i)=recpart(m:n,1);
end
orgh=FRONTHR{test_im}+1;
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);
% espl=im_hr_lef1;
% im_hr_lef1=leftdifmethod;
% leftdifmethod=espl;
% 
% espu=im_hr_up1;
% im_hr_up1=updifmethod;
% updifmethod=espu;
% 
% espf=im_hr_fr1;
% im_hr_fr1=frontdifmethod;
% frontdifmethod=espf;
% 
% espd=im_hr_do1;
% im_hr_do1=downdifmethod;
% downdifmethod=espd;
% 
% espr=im_hr_ri1;
% im_hr_ri1=rightdifmethod;
% rightdifmethod=espr;

recpartimuint=uint8(recpartimage);
end

%% left

if pose==3
  inpdif=LEFTDIF{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        difi=LEFTDIF{i};
        difj=LEFTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wdif=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        difi=LEFTDIF{i};
        difj=LEFTDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
    wdif(i,1)=tmp/denominator;
    tmp=0;
end
%right HR diff method pose 3
rightdifhr = cell(1,input_im);
rightdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%7.7d.tif', k);
         RIGHTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      RIGHTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=RIGHTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=RIGHTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
rightdifmethod=imagedifco;
imagedifco=0;

%left HR diff method pose 3

leftdifhr = cell(1,input_im);
leftdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%4.4d.tif', k);
         LEFTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      LEFTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=LEFTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=LEFTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
leftdifmethod=imagedifco;
imagedifco=0;

%front HR diff method pose 3
frontdifhr = cell(1,input_im);
frontdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      FRONTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=FRONTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=FRONTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
frontdifmethod=imagedifco;
imagedifco=0;

%up HR diff method pose 3

updifhr = cell(1,input_im);
updifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%2.2d.tif', k);
         UPDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71; 
                 uc=UPDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      UPDIFHRC{k}=vdifhr;
  end
  
inpihdiff=UPDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=UPDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
updifmethod=imagedifco;
imagedifco=0;

%down HR diff method pose 3

downdifhr = cell(1,input_im);
downdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%3.3d.tif', k);
         DOWNDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      DOWNDIFHRC{k}=vdifhr;
  end
  
inpihdiff=DOWNDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=DOWNDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
downdifmethod=imagedifco;
imagedifco=0;
 %paper method pose 3 
inpi=LEFTC{test_im}+1;
tmp=0;
 w=zeros(train_im,1);
 for i=1:train_im
    for j=1:train_im
        imi=LEFTC{i};
        imj=LEFTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
 end
denominator=tmp;
 tmp=0;
for i=1:train_im
    for j=1:train_im
        imi=LEFTC{i};
        imj=LEFTC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:train_im
    vec=FRONTC{i};
    ans=ans+w(i,1)*vec;
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{test_im}+1;

ans=zeros(72,48);

for i=1:train_im
   
    FRONTDIFHR{i}=im2double(FRONTDIFHR{i});
    ans=ans+w(i,1)*FRONTDIFHR{i};
end
im_hr_fr1=ans;

ans=zeros(72,48);
for i=1:train_im
    RIGHTDIFHR{i}=im2double(RIGHTDIFHR{i});
    ans=ans+w(i,1)*RIGHTDIFHR{i};
end
im_hr_ri1=ans;

ans=zeros(72,48);
for i=1:train_im
    LEFTDIFHR{i}=im2double(LEFTDIFHR{i});
    ans=ans+w(i,1)*LEFTDIFHR{i};
end
im_hr_lef1=ans;

ans=zeros(72,48);
for i=1:train_im
    UPDIFHR{i}=im2double(UPDIFHR{i});
    ans=ans+w(i,1)*UPDIFHR{i};
end
im_hr_up1=ans;

ans=zeros(72,48);
for i=1:train_im
    DOWNDIFHR{i}=im2double(DOWNDIFHR{i});
    ans=ans+w(i,1)*DOWNDIFHR{i};
end
im_hr_do1=ans;
%partialy reconstructed method pose 3
%lip as vector pose 3
lipinp=LIPLEFT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        lipi=LIPLEFT{i};
        lipj=LIPLEFT{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wlip=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
    wlip(i,1)=tmp/denominator;
    tmp=0;
end

anslip=zeros(24,1);
for i=1:train_im
    lipvec=LIP{i};
    anslip=anslip+wlip(i,1)*lipvec;
end

%eye as vector pose 2
eyeinp=EYELEFT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        eyei=EYELEFT{i};
        eyej=EYELEFT{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 weye=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        eyei=EYELEFT{i};
        eyej=EYELEFT{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
    weye(i,1)=tmp/denominator;
    tmp=0;
end

anseye=zeros(24,1);
for i=1:train_im
    eyevec=EYE{i};
    anseye=anseye+weye(i,1)*eyevec;
end

%else as vector
faceinp=ELSELEFT{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wface=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        facei=ELSELEFT{i};
        facej=ELSELEFT{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
    wface(i,1)=tmp/denominator;
    tmp=0;
end

ansface=zeros(168,1);
for i=1:train_im
    facevec=ELSELEFT{i};
    anseye=ansface+wface(i,1)*facevec;
end


%constructing HR partialy head pose
fronthr = cell(1,input_im);
fronthrc=cell(1,input_im);  
v=zeros(3456,1);
eyh=zeros(384,1);
lih=zeros(384,1);
fach=zeros(2688,1);
eyeh=cell(1,input_im);
liph=cell(1,input_im);
faceh=cell(1,input_im);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
             %vector of eyes HR

       for i=1:32
           eyh(12*i-11:12*i,1)=v((i-1)*72+597:(i-1)*72+608,1); 
       end 
       %vector of lips
        for i=1:32
            lih(12*i-11:12*i,1)=v((i-1)*72+617:(i-1)*72+628,1);
        end
        %vector else
        fach(1:576,1)=v(1:576,1);
        fach(2113:2688,1)=v(2881:3456,1);
         for i=1:32
              fach(577+(i-1)*48:596+(i-1)*48,1)=v(577+(i-1)*72:596+(i-1)*72,1);
              fach(597+(i-1)*48:604+(i-1)*48,1)=v(609+(i-1)*72:616+(i-1)*72,1);
              fach(605+(i-1)*48:624+(i-1)*48,1)=v(629+(i-1)*72:648+(i-1)*72,1);
         end
          LIPH{k}=lih;
          EYEH{k}=eyh;
          FACEH{k}=fach;
          FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{test_im}+1;

ansh=zeros(3456,1);
for i=1:train_im
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
%lip reconstruct
lipih=LIP{test_im}+1;

ansliph=zeros(384,1);
for i=1:train_im
    veclip=LIPH{i};
    ansliph=ansliph+wlip(i,1)*veclip;
end
%eye reconstruct
eyeih=EYE{test_im}+1;
anseyeh=zeros(384,1);
for i=1:train_im
    veceye=EYEH{i};
    anseyeh=anseyeh+weye(i,1)*veceye;
end
%face reconstruct

ansfaceh=zeros(2688,1);
for i=1:train_im
    vecface=FACEH{i};
    ansfaceh=ansfaceh+wface(i,1)*vecface;
end

%put diffrent part in their place
recpart=zeros(3456,1);
 for i=1:32
           recpart((i-1)*72+597:(i-1)*72+608,1)=anseyeh(12*i-11:12*i,1);
 end
     
 for i=1:32
           recpart((i-1)*72+617:(i-1)*72+628,1)=ansliph(12*i-11:12*i,1);
 end
        
         recpart(1:576,1)=ansfaceh(1:576,1);
         recpart(2881:3456,1)=ansfaceh(2113:2688,1); 
        
         for i=1:32
              recpart(577+(i-1)*72:596+(i-1)*72,1)=ansfaceh(577+(i-1)*48:596+(i-1)*48,1);
              recpart(609+(i-1)*72:616+(i-1)*72,1)=ansfaceh(597+(i-1)*48:604+(i-1)*48,1);
              recpart(629+(i-1)*72:648+(i-1)*72,1)=ansfaceh(605+(i-1)*48:624+(i-1)*48,1);
         end

        recpartimage=zeros(72,48);
        
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     recpartimage(:,i)=recpart(m:n,1);
end
orgh=FRONTHR{test_im}+1;
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);

recpartimuint=uint8(recpartimage);
end

%% up

if pose==4
  inpdif=UPDIF{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        difi=UPDIF{i};
        difj=UPDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wdif=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        difi=UPDIF{i};
        difj=UPDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
    wdif(i,1)=tmp/denominator;
    tmp=0;
end
%right HR diff method pose 4
rightdifhr = cell(1,input_im);
rightdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%7.7d.tif', k);
         RIGHTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      RIGHTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=RIGHTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=RIGHTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
rightdifmethod=imagedifco;
imagedifco=0;

%left HR diff method pose 4

leftdifhr = cell(1,input_im);
leftdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%4.4d.tif', k);
         LEFTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      LEFTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=LEFTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=LEFTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
leftdifmethod=imagedifco;
imagedifco=0;

%front HR diff method pose 4
frontdifhr = cell(1,input_im);
frontdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      FRONTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=FRONTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=FRONTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
frontdifmethod=imagedifco;
imagedifco=0;

%up HR diff method pose 4

updifhr = cell(1,input_im);
updifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%2.2d.tif', k);
         UPDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=UPDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      UPDIFHRC{k}=vdifhr;
  end
  
inpihdiff=UPDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=UPDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
updifmethod=imagedifco;
imagedifco=0;

%down HR diff method pose 4

downdifhr = cell(1,input_im);
downdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%3.3d.tif', k);
         DOWNDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      DOWNDIFHRC{k}=vdifhr;
  end
  
inpihdiff=DOWNDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=DOWNDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
downdifmethod=imagedifco;
imagedifco=0;
 %paper method pose 4 
inpi=UPC{test_im}+1;
tmp=0;
 w=zeros(train_im,1);
 for i=1:train_im
    for j=1:train_im
        imi=UPC{i};
        imj=UPC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
 end
denominator=tmp;
 tmp=0;
for i=1:train_im
    for j=1:train_im
        imi=UPC{i};
        imj=UPC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:train_im
    vec=FRONTC{i};
    ans=ans+w(i,1)*vec;
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{test_im}+1;

ans=zeros(72,48);

for i=1:train_im
   
    FRONTDIFHR{i}=im2double(FRONTDIFHR{i});
    ans=ans+w(i,1)*FRONTDIFHR{i};
end
im_hr_fr1=ans;

ans=zeros(72,48);
for i=1:train_im
    RIGHTDIFHR{i}=im2double(RIGHTDIFHR{i});
    ans=ans+w(i,1)*RIGHTDIFHR{i};
end
im_hr_ri1=ans;

ans=zeros(72,48);
for i=1:train_im
    LEFTDIFHR{i}=im2double(LEFTDIFHR{i});
    ans=ans+w(i,1)*LEFTDIFHR{i};
end
im_hr_lef1=ans;

ans=zeros(72,48);
for i=1:train_im
    UPDIFHR{i}=im2double(UPDIFHR{i});
    ans=ans+w(i,1)*UPDIFHR{i};
end
im_hr_up1=ans;

ans=zeros(72,48);
for i=1:train_im
    DOWNDIFHR{i}=im2double(DOWNDIFHR{i});
    ans=ans+w(i,1)*DOWNDIFHR{i};
end
im_hr_do1=ans;
%partialy reconstructed method pose 2
%lip as vector pose 2
lipinp=LIPUP{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        lipi=LIPUP{i};
        lipj=LIPUP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wlip=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
    wlip(i,1)=tmp/denominator;
    tmp=0;
end

anslip=zeros(24,1);
for i=1:train_im
    lipvec=LIP{i};
    anslip=anslip+wlip(i,1)*lipvec;
end

%eye as vector pose 2
eyeinp=EYEUP{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        eyei=EYEUP{i};
        eyej=EYEUP{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 weye=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        eyei=EYEUP{i};
        eyej=EYEUP{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
    weye(i,1)=tmp/denominator;
    tmp=0;
end

anseye=zeros(24,1);
for i=1:train_im
    eyevec=EYE{i};
    anseye=anseye+weye(i,1)*eyevec;
end

%else as vector
faceinp=ELSEUP{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wface=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        facei=ELSEUP{i};
        facej=ELSEUP{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
    wface(i,1)=tmp/denominator;
    tmp=0;
end

ansface=zeros(168,1);
for i=1:train_im
    facevec=ELSEUP{i};
    anseye=ansface+wface(i,1)*facevec;
end

%constructing HR partialy head pose
fronthr = cell(1,input_im);
fronthrc=cell(1,input_im);  
v=zeros(3456,1);
eyh=zeros(384,1);
lih=zeros(384,1);
fach=zeros(2688,1);
eyeh=cell(1,input_im);
liph=cell(1,input_im);
faceh=cell(1,input_im);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
             %vector of eyes HR

       for i=1:32
           eyh(12*i-11:12*i,1)=v((i-1)*72+597:(i-1)*72+608,1); 
       end 
       %vector of lips
        for i=1:32
            lih(12*i-11:12*i,1)=v((i-1)*72+617:(i-1)*72+628,1);
        end
        %vector else
        fach(1:576,1)=v(1:576,1);
        fach(2113:2688,1)=v(2881:3456,1);
         for i=1:32
              fach(577+(i-1)*48:596+(i-1)*48,1)=v(577+(i-1)*72:596+(i-1)*72,1);
              fach(597+(i-1)*48:604+(i-1)*48,1)=v(609+(i-1)*72:616+(i-1)*72,1);
              fach(605+(i-1)*48:624+(i-1)*48,1)=v(629+(i-1)*72:648+(i-1)*72,1);
         end
          LIPH{k}=lih;
          EYEH{k}=eyh;
          FACEH{k}=fach;
          FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{test_im}+1;

ansh=zeros(3456,1);
for i=1:train_im
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
%lip reconstruct
lipih=LIP{test_im}+1;

ansliph=zeros(384,1);
for i=1:train_im
    veclip=LIPH{i};
    ansliph=ansliph+wlip(i,1)*veclip;
end
%eye reconstruct
eyeih=EYE{test_im}+1;
anseyeh=zeros(384,1);
for i=1:train_im
    veceye=EYEH{i};
    anseyeh=anseyeh+weye(i,1)*veceye;
end
%face reconstruct

ansfaceh=zeros(2688,1);
for i=1:train_im
    vecface=FACEH{i};
    ansfaceh=ansfaceh+wface(i,1)*vecface;
end

%put diffrent part in their place
recpart=zeros(3456,1);
 for i=1:32
           recpart((i-1)*72+597:(i-1)*72+608,1)=anseyeh(12*i-11:12*i,1);
 end
     
 for i=1:32
           recpart((i-1)*72+617:(i-1)*72+628,1)=ansliph(12*i-11:12*i,1);
 end
        
         recpart(1:576,1)=ansfaceh(1:576,1);
         recpart(2881:3456,1)=ansfaceh(2113:2688,1); 
        
         for i=1:32
              recpart(577+(i-1)*72:596+(i-1)*72,1)=ansfaceh(577+(i-1)*48:596+(i-1)*48,1);
              recpart(609+(i-1)*72:616+(i-1)*72,1)=ansfaceh(597+(i-1)*48:604+(i-1)*48,1);
              recpart(629+(i-1)*72:648+(i-1)*72,1)=ansfaceh(605+(i-1)*48:624+(i-1)*48,1);
         end

        recpartimage=zeros(72,48);
        
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     recpartimage(:,i)=recpart(m:n,1);
end
orgh=FRONTHR{test_im}+1;
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);

recpartimuint=uint8(recpartimage);
end

%% down
if pose==5
  inpdif=DOWNDIF{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        difi=DOWNDIF{i};
        difj=DOWNDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wdif=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        difi=DOWNDIF{i};
        difj=DOWNDIF{j};
        Sum=(inpdif-difi)'*(inpdif-difj);
        tmp=tmp+(1/Sum);
    end
    wdif(i,1)=tmp/denominator;
    tmp=0;
end
%right HR diff method pose 5
rightdifhr = cell(1,input_im);
rightdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%7.7d.tif', k);
         RIGHTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=RIGHTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      RIGHTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=RIGHTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=RIGHTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
rightdifmethod=imagedifco;
imagedifco=0;

%left HR diff method pose 5

leftdifhr = cell(1,input_im);
leftdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%4.4d.tif', k);
         LEFTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=LEFTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      LEFTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=LEFTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=LEFTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
leftdifmethod=imagedifco;
imagedifco=0;

%front HR diff method pose 5
frontdifhr = cell(1,input_im);
frontdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      FRONTDIFHRC{k}=vdifhr;
  end
  
inpihdiff=FRONTDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=FRONTDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
frontdifmethod=imagedifco;
imagedifco=0;

%up HR diff method pose 5

updifhr = cell(1,input_im);
updifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%2.2d.tif', k);
         UPDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=UPDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      UPDIFHRC{k}=vdifhr;
  end
  
inpihdiff=UPDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=UPDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
updifmethod=imagedifco;
imagedifco=0;

%down HR diff method pose 5

downdifhr = cell(1,input_im);
downdifhrc=cell(1,input_im);  
vdifhr=zeros(3456,1);
  for k = 1 : input_im
         a = sprintf('%3.3d.tif', k);
         DOWNDIFHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=DOWNDIFHR{k};
                 vdifhr(m:n,1)=uc(:,i);
             end
      DOWNDIFHRC{k}=vdifhr;
  end
  
inpihdiff=DOWNDIFHRC{test_im}+1;

anshdiff=zeros(3456,1);
for i=1:train_im
    vec=DOWNDIFHRC{i};
    anshdiff=anshdiff+wdif(i,1)*vec;
end

ansihdiff=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdiff(:,i)=anshdiff(m:n,1);
end
imagedifco=ansihdiff;
downdifmethod=imagedifco;
imagedifco=0;
 %paper method pose 5 
inpi=DOWNC{test_im}+1;
tmp=0;
 w=zeros(train_im,1);
 for i=1:train_im
    for j=1:train_im
        imi=DOWNC{i};
        imj=DOWNC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
 end
denominator=tmp;
 tmp=0;
for i=1:train_im
    for j=1:train_im
        imi=DOWNC{i};
        imj=DOWNC{j};
        Sum=(inpi-imi)'*(inpi-imj);
        tmp=tmp+(1/Sum);
    end
    w(i,1)=tmp/denominator;
    tmp=0;
end

ans=zeros(216,1);
for i=1:train_im
    vec=FRONTC{i};
    ans=ans+w(i,1)*vec;
end

ansi=zeros(18,12);
for i=1:12
     m=(i-1)*18+1;
     n=m+17;
     ansi(:,i)=ans(m:n,1);
end
org=FRONT{test_im}+1;

ans=zeros(72,48);

for i=1:train_im
   
    FRONTDIFHR{i}=im2double(FRONTDIFHR{i});
    ans=ans+w(i,1)*FRONTDIFHR{i};
end
im_hr_fr1=ans;

ans=zeros(72,48);
for i=1:train_im
    RIGHTDIFHR{i}=im2double(RIGHTDIFHR{i});
    ans=ans+w(i,1)*RIGHTDIFHR{i};
end
im_hr_ri1=ans;

ans=zeros(72,48);
for i=1:train_im
    LEFTDIFHR{i}=im2double(LEFTDIFHR{i});
    ans=ans+w(i,1)*LEFTDIFHR{i};
end
im_hr_lef1=ans;

ans=zeros(72,48);
for i=1:train_im
    UPDIFHR{i}=im2double(UPDIFHR{i});
    ans=ans+w(i,1)*UPDIFHR{i};
end
im_hr_up1=ans;

ans=zeros(72,48);
for i=1:train_im
    DOWNDIFHR{i}=im2double(DOWNDIFHR{i});
    ans=ans+w(i,1)*DOWNDIFHR{i};
end
im_hr_do1=ans;
%partialy reconstructed method pose 5
%lip as vector pose 5
lipinp=LIPDOWN{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        lipi=LIPDOWN{i};
        lipj=LIPDOWN{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wlip=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        lipi=LIP{i};
        lipj=LIP{j};
        Sum=(lipinp-lipi)'*(lipinp-lipj);
        tmp=tmp+(1/Sum);
    end
    wlip(i,1)=tmp/denominator;
    tmp=0;
end

anslip=zeros(24,1);
for i=1:train_im
    lipvec=LIP{i};
    anslip=anslip+wlip(i,1)*lipvec;
end

%eye as vector pose 2
eyeinp=EYEDOWN{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        eyei=EYEDOWN{i};
        eyej=EYEDOWN{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 weye=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        eyei=EYEDOWN{i};
        eyej=EYEDOWN{j};
        Sum=(eyeinp-eyei)'*(eyeinp-eyej);
        tmp=tmp+(1/Sum);
    end
    weye(i,1)=tmp/denominator;
    tmp=0;
end

anseye=zeros(24,1);
for i=1:train_im
    eyevec=EYE{i};
    anseye=anseye+weye(i,1)*eyevec;
end

%else as vector
faceinp=ELSEDOWN{test_im}+1;
tmp=0;
for i=1:train_im
    for j=1:train_im
        facei=FACE{i};
        facej=FACE{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
end
denominator=tmp;
 tmp=0;
 wface=zeros(train_im,1);
for i=1:train_im
    for j=1:train_im
        facei=ELSEDOWN{i};
        facej=ELSEDOWN{j};
        Sum=(faceinp-facei)'*(faceinp-facej);
        tmp=tmp+(1/Sum);
    end
    wface(i,1)=tmp/denominator;
    tmp=0;
end

ansface=zeros(168,1);
for i=1:train_im
    facevec=ELSEDOWN{i};
    anseye=ansface+wface(i,1)*facevec;
end

%constructing HR partialy head pose
fronthr = cell(1,input_im);
fronthrc=cell(1,input_im);  
v=zeros(3456,1);
eyh=zeros(384,1);
lih=zeros(384,1);
fach=zeros(2688,1);
eyeh=cell(1,input_im);
liph=cell(1,input_im);
faceh=cell(1,input_im);
  for k = 1 : input_im
         a = sprintf('%6.6d.tif', k);
         FRONTHR{k} = imread(a);
             for i=1:48
                 m=(i-1)*72+1;
                 n=m+71;
                 uc=FRONTHR{k};
                 v(m:n,1)=uc(:,i);
             end
             %vector of eyes HR

       for i=1:32
           eyh(12*i-11:12*i,1)=v((i-1)*72+597:(i-1)*72+608,1); 
       end 
       %vector of lips
        for i=1:32
            lih(12*i-11:12*i,1)=v((i-1)*72+617:(i-1)*72+628,1);
        end
        %vector else
        fach(1:576,1)=v(1:576,1);
        fach(2113:2688,1)=v(2881:3456,1);
         for i=1:32
              fach(577+(i-1)*48:596+(i-1)*48,1)=v(577+(i-1)*72:596+(i-1)*72,1);
              fach(597+(i-1)*48:604+(i-1)*48,1)=v(609+(i-1)*72:616+(i-1)*72,1);
              fach(605+(i-1)*48:624+(i-1)*48,1)=v(629+(i-1)*72:648+(i-1)*72,1);
         end
          LIPH{k}=lih;
          EYEH{k}=eyh;
          FACEH{k}=fach;
          FRONTHRC{k}=v;
  end
  
inpih=FRONTHRC{test_im}+1;

ansh=zeros(3456,1);
for i=1:train_im
    vec=FRONTHRC{i};
    ansh=ansh+w(i,1)*vec;
end

ansih=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansih(:,i)=ansh(m:n,1);
end
%lip reconstruct
lipih=LIP{test_im}+1;

ansliph=zeros(384,1);
for i=1:train_im
    veclip=LIPH{i};
    ansliph=ansliph+wlip(i,1)*veclip;
end
%eye reconstruct
eyeih=EYE{test_im}+1;
anseyeh=zeros(384,1);
for i=1:train_im
    veceye=EYEH{i};
    anseyeh=anseyeh+weye(i,1)*veceye;
end
%face reconstruct

ansfaceh=zeros(2688,1);
for i=1:train_im
    vecface=FACEH{i};
    ansfaceh=ansfaceh+wface(i,1)*vecface;
end

%put diffrent part in their place
recpart=zeros(3456,1);
 for i=1:32
           recpart((i-1)*72+597:(i-1)*72+608,1)=anseyeh(12*i-11:12*i,1);
 end
     
 for i=1:32
           recpart((i-1)*72+617:(i-1)*72+628,1)=ansliph(12*i-11:12*i,1);
 end
        
         recpart(1:576,1)=ansfaceh(1:576,1);
         recpart(2881:3456,1)=ansfaceh(2113:2688,1); 
        
         for i=1:32
              recpart(577+(i-1)*72:596+(i-1)*72,1)=ansfaceh(577+(i-1)*48:596+(i-1)*48,1);
              recpart(609+(i-1)*72:616+(i-1)*72,1)=ansfaceh(597+(i-1)*48:604+(i-1)*48,1);
              recpart(629+(i-1)*72:648+(i-1)*72,1)=ansfaceh(605+(i-1)*48:624+(i-1)*48,1);
         end

        recpartimage=zeros(72,48);
        
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     recpartimage(:,i)=recpart(m:n,1);
end
orgh=FRONTHR{test_im}+1;
orghuint=uint8(orgh);
orguint=uint8(org);
ansiuint=uint8(ansi);
ansihuint=uint8(ansih);

recpartimuint=uint8(recpartimage);
end
%%
figure(1)
subplot(2,2,4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UP%%%%HERE
imshow(orghuint);
title('Orginal HR');
subplot(2,2,1)
imshow(orguint);
title('Input LR')
subplot(2,2,3)
imshow(ansihuint);
title('Reconstructed HR');
subplot(2,2,2)
imshow(ansiuint);
title('Recontructed LR');
%up
uphr = cell(1,input_im);
uphrc=cell(1,input_im);  
v=zeros(3456,1);
 for k = 1 : input_im
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
  
inpihup=UPHRC{test_im}+1;

anshup=zeros(3456,1);
for i=1:train_im
    vec=UPHRC{i};
    anshup=anshup+w(i,1)*vec;
end

ansihup=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihup(:,i)=anshup(m:n,1);
end
%orghup=UPHR{test_im}+1
%orghuintup=uint8(orghup);
%orguintup=uint8(org);
%ansiuintup=uint8(ansiup);
ansihuintup=uint8(ansihup);

%down

downhr = cell(1,input_im);
downhrc=cell(1,input_im);  
v=zeros(3456,1);
  for k = 1 : input_im
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
  
inpihdown=DOWNHRC{test_im}+1;

anshdown=zeros(3456,1);
for i=1:train_im
    vec=DOWNHRC{i};
    anshdown=anshdown+w(i,1)*vec;
end

ansihdown=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihdown(:,i)=anshdown(m:n,1);
end
% orghdown=DOWNHR{test_im}+1
% orghuintdown=uint8(orghdown);
% orguintdown=uint8(org);
% ansiuintdown=uint8(ansidown);
ansihuintdown=uint8(ansihdown);
% %left
lefthr = cell(1,input_im);
lefthrc=cell(1,input_im);  
v=zeros(3456,1);
  for k = 1 : input_im
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
  
inpihleft=LEFTHRC{test_im}+1;

anshleft=zeros(3456,1);
for i=1:train_im
    vec=LEFTHRC{i};
    anshleft=anshleft+w(i,1)*vec;
end

ansihleft=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihleft(:,i)=anshleft(m:n,1);
end
% orghleft=LEFTHR{test_im}+1
% orghuintleft=uint8(orghleft);
% orguintleft=uint8(org);
% ansiuintleft=uint8(ansileft);
ansihuintleft=uint8(ansihleft);

%right

righthr = cell(1,input_im);
righthrc=cell(1,input_im);  
v=zeros(3456,1);
  for k = 1 : input_im
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
  
inpihright=FRONTHRC{test_im}+1;

anshright=zeros(3456,1);
for i=1:train_im
    vec=RIGHTHRC{i};
    anshright=anshright+w(i,1)*vec;
end

ansihright=zeros(72,48);
for i=1:48
     m=(i-1)*72+1;
     n=m+71;
     ansihright(:,i)=anshright(m:n,1);
end



% %%plot
% subplot(2,5,1)
% imshow(orguint);
% title('Input LR')
% 
% subplot(2,5,6)
% %imshow(BWS1);
% title('Input Skeleton')
% 
% subplot(2,5,2)
% imshow(ansihuint);
% title('Reconstructed Paper Method');
% 
% subplot(2,5,7)
% %imshow(BWS2);
% title('Paper Skeleton');
% 
% subplot(2,5,4)
% %imshow(BWC);
% title('Partialy constructed Method')
% 
% subplot(2,5,9)
% imshow(BWS4);
% title('Partialy constructed Skeleton')
% 
% subplot(2,5,5)
% imshow(orgh);
% title('Orginal HR')
% 
% subplot(2,5,10)
% imshow(BWS5);
% title('Orginal Image Skeleton');

% subplot(2,5,3)
% imshow(difmethod);
% title('Diffrent co Method');
% difmethod=imadjust(difmethod);
% BWS3 = edge(difmethod,'canny');
% subplot(2,5,8)
% imshow(BWS3);
%title('Diffrent co Skeleton');
frontlrinp=uint8(FRONT{input_im});
frontlrinp=imadjust(frontlrinp);
sfrontlrinp = edge(frontlrinp,'canny');

rightlrinp=uint8(RIGHTLR{input_im});
rightlrinp=imadjust(rightlrinp);
srightlrinp = edge(rightlrinp,'canny');

leftlrinp=uint8(LEFTLR{input_im});
leftlrinp=imadjust(leftlrinp);
sleftlrinp = edge(leftlrinp,'canny');

uplrinp=uint8(UPLR{input_im});
uplrinp=imadjust(uplrinp);
suplrinp = edge(uplrinp,'canny');

downlrinp=uint8(DOWNLR{input_im});
downlrinp=imadjust(downlrinp);
sdownlrinp = edge(downlrinp,'canny');









rightdifmethod=uint8(rightdifmethod);
rightdifmethod=imadjust(rightdifmethod);
srightdifmethod = edge(rightdifmethod,'canny');

leftdifmethod=uint8(leftdifmethod);
leftdifmethod=imadjust(leftdifmethod);
sleftdifmethod = edge(leftdifmethod,'canny');

frontdifmethod=uint8(frontdifmethod);
frontdifmethod=imadjust(frontdifmethod);
sfrontdifmethod = edge(frontdifmethod,'canny');

updifmethod=uint8(updifmethod);
updifmethod=imadjust(updifmethod);
supdifmethod = edge(updifmethod,'canny');

downdifmethod=uint8(downdifmethod);
downdifmethod=imadjust(downdifmethod);
sdowndifmethod = edge(downdifmethod,'canny');







paperright=im_hr_ri1 ;
spaperright = edge(paperright,'canny');


paperfront=im_hr_fr1;
spaperfront = edge(paperfront,'canny');


paperleft=im_hr_lef1;
spaperleft = edge(paperleft,'canny');


paperup=im_hr_up1;
spaperup = edge(paperup,'canny');


paperdown=im_hr_do1;
spaperdown = edge(paperdown,'canny');




recpartimuint=imadjust(recpartimuint);
srecpartimuint = edge(recpartimuint,'canny');


%% plot all
figure (2)
subplot(7,5,1)
imshow(leftlrinp);
title('LR left inp')


subplot(7,5,2)
imshow(uplrinp);
title('LR up inp')


subplot(7,5,3)
imshow(frontlrinp);
title('LR front inp')


subplot(7,5,4)
imshow(downlrinp);
title('LR down inp')


subplot(7,5,5)
imshow(rightlrinp);
title('LR right inp')

subplot(7,5,6)
imshow(sleftlrinp);


subplot(7,5,7)
imshow(suplrinp);


subplot(7,5,8)
imshow(sfrontlrinp);



subplot(7,5,9)
imshow(sdownlrinp);


subplot(7,5,10)
imshow(srightlrinp);

subplot(7,5,11)
imshow(paperleft)
title('paper method left')


subplot(7,5,12)
imshow(paperup);
title('paper method up')


subplot(7,5,13)
imshow(paperfront);
title('paper method front')


subplot(7,5,14)
imshow(paperdown);
title('paper method down')


subplot(7,5,15)
imshow(im_hr_ri1);
title('paper method right')

subplot(7,5,16)
imshow(spaperleft);


subplot(7,5,17)
imshow(spaperup);


subplot(7,5,18)
imshow(spaperfront);


subplot(7,5,19)
imshow(spaperdown);


subplot(7,5,20)
imshow(spaperright);


subplot(7,5,21)
imshow(leftdifmethod);
title('propose1 left ')


subplot(7,5,22)
imshow(updifmethod);
title('propose1 up')


subplot(7,5,23)
imshow(frontdifmethod);
title('propose1 front')


subplot(7,5,24)
imshow(downdifmethod);
title('propose1 down')


subplot(7,5,25)
imshow(rightdifmethod);
title('propose1 right')

subplot(7,5,26)
imshow(sleftdifmethod);


subplot(7,5,27)
imshow(supdifmethod);


subplot(7,5,28)
imshow(sfrontdifmethod);



subplot(7,5,29)
imshow(sdowndifmethod);


subplot(7,5,30)
imshow(srightdifmethod);

subplot(7,5,33)
imshow(recpartimuint);
title('propose2 front')


%% plot paper vs proposed 1
figure(3)
subplot(5,5,1)
imshow(downlrinp);
title('LR down inp')

subplot(5,5,6)
imshow(leftlrinp)
title('LR left inp')


subplot(5,5,11)
imshow(frontlrinp);
title('LR front inp')


subplot(5,5,16)
imshow(rightlrinp);
title('LR right inp')


subplot(5,5,21)
imshow(uplrinp);
title('LR up inp')

subplot(5,5,3)
imshow(paperdown);
title('Multiple down')

subplot(5,5,8)
imshow(paperleft)
title('Multiple left')


subplot(5,5,13)
imshow(paperfront);
title('Multiple front')


subplot(5,5,18)
imshow(paperright);
title('Multiple right')


subplot(5,5,23)
imshow(paperup);
title('Multiple up')

subplot(5,5,20)
imshow(RIGHTDIFHR{test_im})
title('orginal HR right')

subplot(5,5,10)
imshow(LEFTDIFHR{test_im})
title('orginal HR left')

subplot(5,5,15)
imshow(FRONTDIFHR{test_im})
title('orginal HR front')

subplot(5,5,25)
imshow(UPDIFHR{test_im})
title('orginal HR up')

subplot(5,5,5)
imshow(DOWNDIFHR{test_im})
title('orginal HR down')
 
figure(4)
 subplot(3,7,4)
imshow(paperdown);
title('Multiple down')

subplot(3,7,1)
imshow(paperleft)
title('Multiple left')


subplot(3,7,3)
imshow(paperfront);
title('Multiple front')


subplot(3,7,5)
imshow(paperright);
title('Multiple right')


subplot(3,7,2)
imshow(paperup);
title('Multiple up')
%% plot paper vs proposed2
figure(5)
subplot(1,4,1)
imshow(downlrinp);
title('LR down inp')

subplot(1,4,2)
imshow(paperfront);
title('Ziang Mas method front')

subplot(1,4,3)
imshow(recpartimuint);
title('propose2 front')

subplot(1,4,4)
imshow(FRONTDIFHR{test_im})
title('orginal HR front')

%% plot paper vs proposed 1 skeletoon
figure (6)
subplot(3,6,7)
imshow(downlrinp);
title('LR down inp')

subplot(3,6,14)
imshow(edge(LEFTDIFHR{test_im},'canny'))
title('HR left Skeleton')

subplot(3,6,15)
imshow(edge(UPDIFHR{test_im},'canny'));
title('HR up Skeleton')


subplot(3,6,16)
imshow(edge(FRONTDIFHR{test_im},'canny'));
title('HR front Skeleton')


subplot(3,6,17)
imshow(edge(DOWNDIFHR{test_im},'canny'));
title('HR down Skeleton')


subplot(3,6,18)
imshow(edge(RIGHTDIFHR{test_im},'canny'));
title('HR right Skeleton')


subplot(3,6,2)
imshow(spaperleft);
title('Ziang Mas left Skeleton ')


subplot(3,6,3)
imshow(spaperup);
title('Ziang Mas up Skeleton')


subplot(3,6,4)
imshow(spaperfront);
title('Ziang Mas front Skeleton')


subplot(3,6,5)
imshow(spaperdown);
title('Ziang Mas down Skeleton')


subplot(3,6,6)
imshow(spaperright);
title('Ziang Mas right Skeleton')

subplot(3,6,12)
imshow(srightdifmethod)
title('Proposed1 right Skeleton')

subplot(3,6,8)
imshow(sleftdifmethod)
title('Proposed1 left Skeleton')

subplot(3,6,10)
imshow(sfrontdifmethod)
title('Proposed1 front Skeleton')

subplot(3,6,9)
imshow(supdifmethod)
title('Proposed1 up Skeleton')

subplot(3,6,11)
imshow(sdowndifmethod)
title('Proposed1 down Skeleton')

%%  skeleton proposed1 single input vs multiple input
figure(7)
subplot(3,6,7)
imshow(downlrinp);
title('LR down inp')

subplot(3,6,2)
imshow(paperleft)
title('Ziang Mas method left')


subplot(3,6,3)
imshow(paperup);
title('Ziang Mas method up')


subplot(3,6,4)
imshow(paperfront);
title('Ziang Mas method front')


subplot(3,6,5)
imshow(paperdown);
title('Ziang Mas method down')


subplot(3,6,6)
imshow(im_hr_ri1);
title('Ziang Mas method right')


subplot(3,6,8)
imshow(leftdifmethod);
title('propose1 left ')


subplot(3,6,9)
imshow(updifmethod);
title('propose1 up')


subplot(3,6,10)
imshow(frontdifmethod);
title('propose1 front')


subplot(3,6,11)
imshow(downdifmethod);
title('propose1 down')


subplot(3,6,12)
imshow(rightdifmethod);
title('propose1 right')

subplot(3,6,18)
imshow(RIGHTDIFHR{test_im})
title('orginal HR right')

subplot(3,6,14)
imshow(LEFTDIFHR{test_im})
title('orginal HR left')

subplot(3,6,16)
imshow(FRONTDIFHR{test_im})
title('orginal HR front')

subplot(3,6,15)
imshow(UPDIFHR{test_im})
title('orginal HR up')

subplot(3,6,17)
imshow(DOWNDIFHR{test_im})
title('orginal HR down')


%% plot paper vs proposed2
figure(8)
subplot(1,4,1)
imshow(downlrinp);
title('LR down inp')

subplot(1,4,2)
imshow(edge(sfrontdifmethod,'canny'));
title('single input Skeleton')

subplot(1,4,3)
imshow(edge(paperfront,'canny'));
title('multiple input Skeleton')

subplot(1,4,4)
imshow(edge(FRONTDIFHR{test_im},'canny'))
title('orginal HR Skeleton')

% plot Multiple input
 subplot(5,5,11)
imshow(downlrinp);
title('LR down inp')

subplot(5,5,1)
imshow(rightlrinp);
title('LR right inp')

subplot(5,5,6)
imshow(uplrinp);
title('LR up inp')

subplot(5,5,16)
imshow(frontlrinp);
title('LR front inp')

subplot(5,5,21)
imshow(leftlrinp);
title('LR left inp')

paperfront=imadjust(paperfront);

subplot(5,5,13)
imshow(paperfront);
title('Multiple input propsed1')

subplot(5,5,12)
imshow(frontdifmethod);
title('Single input propsed1')

subplot(5,5,14)
imshow(FRONTDIFHR{test_im})
title('orginal HR')
 
