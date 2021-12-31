function j2=sad_lip_seg(k,m)
sad_lip_RGB=imread("sad lip.jpg");
%subplot(1,3,1);
%imshow(sad_lip_RGB);
%title("Original Image");
[BW,maskedImage] = segmentImage_sad(sad_lip_RGB);
%subplot(1,3,2);
%imshow(BW);
%title("Segmented Binary Image");
%subplot(1,3,3);
%imshow(maskedImage);
%title("Segmented Color Image");
%sad
j2=k;
mi=imresize(maskedImage,[m(4)-5 m(3)+5]);
%imshow(mi);
l=imresize(sad_lip_RGB,[m(4)-5 m(3)+5]);
%l=im2gray(l);
for i=1:m(4)-5
    for j=1:m(3)
        if mi(i,j)~=0
            j2(i+m(2),j+m(1),1)=l(i,j,1);
            j2(i+m(2),j+m(1),2)=l(i,j,2);
            j2(i+m(2),j+m(1),3)=l(i,j,3);
        end
    end
end
figure('Name','FROWN')
imshow(j2)
end