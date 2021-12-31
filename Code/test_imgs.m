clc
close all
load('AlexNet_64p03.mat')
imgAddress='sad1.jpg';
img=imread(imgAddress);
%imshow(img)
faceDetector=vision.CascadeObjectDetector;
bbox=step(faceDetector,img);


if ~isempty(bbox)
    bbox=bbox(1,:);
    %rectangle('Position',bbox,'edgecolor','b','LineWidth',5);
    FaceCropped=imcrop(img,bbox);
end
FaceResized=imresize(FaceCropped,[227 227]);
[YPred,probs]=classify(net,FaceResized);
a=nominal(YPred)
pred_str=cellstr(a)
position=[0 0;];

box_color={'red'};
RGB=insertText(img,position,pred_str,'FontSize',18,'BoxColor',...
    box_color,'BoxOpacity',0.4,'TextColor','Black');
figure,imshow(RGB)

rectangle('Position',bbox,'edgecolor','b','LineWidth',5);

fig = uifigure('Name','CHANGE EMOTIONS');
fig.Position(3:4) = [380 310];

[k,m]=EmotionChanger(imgAddress);

btn1 = uibutton(fig,'push',...
                'Text','Smile',...
               'Position',[100 200 200 42],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed1(btn1,k,m));
btn2 = uibutton(fig,'push',...
                'Text','Frown',...
               'Position',[100 150 200 42],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed2(btn2,k,m));
btn3 = uibutton(fig,'push',...
                'Text','Neutral',...
               'Position',[100 100 200 42],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed3(btn3,k,m));
btn1.BackgroundColor='y';
btn1.FontWeight='bold';
btn1.FontSize=14;
btn2.BackgroundColor='g';
btn2.FontWeight='bold';
btn2.FontSize=14;
btn3.BackgroundColor='#4DBEEE';
btn3.FontWeight='bold';
btn3.FontSize=14;

function plotButtonPushed2(btn,k,m)
        sad_lip_seg(k,m);
end

function plotButtonPushed1(btn,k,m)
        smile_lip_seg(k,m);
end

function plotButtonPushed3(btn,k,m)
        neutral_lip_seg(k,m);
end
