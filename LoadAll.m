clear
clc

input_im=66;
in=zeros(216,input_im,4);

for k = 1 : input_im
         a = sprintf('%0.8d.tif', k);
         b = imread(a);
         in(:,k,1)=double(b(:));
end
for k = 1 : input_im
         a = sprintf('%0.9d.tif', k);
         b = imread(a);
         in(:,k,2)=double(b(:));
end
for k = 1 : input_im
         a = sprintf('%0.10d.tif', k);
         b = imread(a);
         in(:,k,3)=double(b(:));
end
for k = 1 : input_im
         a = sprintf('%0.11d.tif', k);
         b = imread(a);
         in(:,k,4)=double(b(:));
end

% for k = 1 : input_im
%     a=sprintf('%5.5d.TIF',k);
%     in{k} = imread(a);
%     %if(~isempty(FRONTLR{k}))
%        v=reshape(i{k}',numel(FRONT{k}),1);
%     %end
% end


for k = 1 : 66
         a = sprintf('%6.6d.tif', k);
         b = imread(a);
         out(:,k)=double(b(:));
end
%%
input=in(:,1:10);
output=out(:,1:10);
%%
psnr=10*log(255/1000)