function j3=neutral_lip_seg(k,m)
RGB=imread("neutral lip.jpg");
%subplot(1,3,1);
%imshow(RGB);
%title("Original Image");
[BW,maskedImage] = segmentImage(RGB);
%subplot(1,3,2);
%imshow(BW);
%title("Segmented Binary Image");
%subplot(1,3,3);
%imshow(maskedImage);
%title("Segmented Color Image");
%neutral
j3=k;
mi=imresize(maskedImage,[m(4) m(3)]);
%imshow(mi);
l=imresize(RGB,[m(4) m(3)]);
%l=im2gray(l);
for i=1:m(4)
    for j=1:m(3)
        if mi(i,j)~=0
            j3(i+m(2),j+m(1),1)=l(i,j,1);
            j3(i+m(2),j+m(1),2)=l(i,j,2);
            j3(i+m(2),j+m(1),3)=l(i,j,3);
        end
    end
end
figure('Name','NEUTRAL')
imshow(j3)
end