function [k,m] = EmotionChanger(image)
%image="C:\Users\varna\OneDrive\Desktop\MATLAB\FinalTest\f (144).jpg";
face=imread(image);
%face=im2gray(face);

k=0;

fd=vision.CascadeObjectDetector;
X=step(fd,face);

MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
m=step(MouthDetect,face);

EyeDetect = vision.CascadeObjectDetector('EyePairBig');
e=step(EyeDetect,face);
if size(e)>0
    e=e(1,:);
end

n=vision.CascadeObjectDetector('Nose','MergeThreshold',16);
v=step(n,face);
if size(v)>0
    e1=v(1,:);
end

if size(m)>0
    if(size(X)>0)
    X=X(1,:);
    remCount=0;
    for i=1:size(m)
        x=m(i-remCount,:);
        if ~and(and(X(1)<x(1),X(2)<x(2)),and(X(1)+X(3)>x(1)+x(3),abs(X(2)+X(4)-(x(2)+x(4)))<100))
            m(i-remCount,:)=[];
            remCount=remCount+1;
        end
    end
    end
    if size(m)>1
        index=1;
        if size(e)~=0  %if eyes are detected
            x=m(1,:);
            max=-e(2)-e(4)+x(2)+x(4);
            for i=1:size(m)
                x=m(i,:);
                x=-e(2)-e(4)+x(2)+x(4);
                if max<x
                    max=x;
                    index=i;
                end
            end
            m=m(index,:);
       %{ elseif size(n)>0    %nose is detected but not eyes
         %   x=m(1,:);
          %  min=abs(e1(2)+e1(4)-x(2)-x(4));
          %  for i=1:size(m)
          %      x1=m(i,:);
          %      x=abs(e1(2)+e1(4)-x1(2)-x1(4));
           %     if and(min>x, abs(e1(2)+e1(4)-x1(2))<15)
           %         min=x;
            %        index=i;
            %    end
           % end
           
        else
            x=m(1,:);
            max=x(1)+x(3);
            for i=1:size(m)
                x=m(i,:);
                x=x(2)+x(4);
                if max<x
                    max=x;
                    index=i;
                end
            end
            m=m(index,:);
        end
    end
    if size(m)==0
        disp('No mouth detected');
    end
else
    disp('No mouth detected');
end

f1=figure('Name','ORIGINAL PICTURE');
imshow(face);

%MASKING MOUTH
if size(m)>0
    
if size(v)>0
if v(2)+v(4)<m(2)
    m(2)=v(2)+v(4);
    m(3)=m(3)+(v(2)+v(4)-m(2));
end
end

h= drawellipse('Position',[m(1)+m(3)/2 m(2)+m(4)/2],'SemiAxes',[m(3)/2+10 m(4)/2]);
mask=createMask(h);
k=inpaintExemplar(face,mask);%,'FillOrder','tensor','PatchSize',7);
imshow(k)
close(f1);

else
    disp('No mouth detected')
end
end
    
