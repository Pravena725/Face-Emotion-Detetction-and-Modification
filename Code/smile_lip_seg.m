function j1=smile_lip_seg(k,m)
smile_lip_RGB=imread("smiling lip.jpg");
%subplot(1,3,1);
%imshow(smile_lip_RGB);
%title("Original Image");
[BW,maskedImage] = segmentImage_smile(smile_lip_RGB);
%subplot(1,3,2);
%imshow(BW);
%title("Segmented Binary Image");
%subplot(1,3,3);
%imshow(maskedImage);
%title("Segmented Color Image");
%smile
j1=k;
mi=imresize(maskedImage,[m(4)+10 m(3)+10]);
%imshow(mi);
l=imresize(smile_lip_RGB,[m(4)+10 m(3)+10]);
%l=im2gray(l);
for i=1:m(4)+10
    for j=1:m(3)+10
        if mi(i,j)~=0
            j1(i+m(2)-5,j+m(1),1)=l(i,j,1);
            j1(i+m(2)-5,j+m(1),2)=l(i,j,2);
            j1(i+m(2)-5,j+m(1),3)=l(i,j,3);
        end
    end
end
figure('Name','SMILE')
imshow(j1)
end
