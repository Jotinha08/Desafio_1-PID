pkg load image

%Imagens
img_completa(:,:,1) = rgb2gray(imread('0Normal.jpg'));
img_completa(:,:,2) = rgb2gray(imread('23h.jpg'));
img_completa(:,:,3) = rgb2gray(imread('28h.jpg'));
img_completa(:,:,4) = rgb2gray(imread('48h.jpg'));
img_completa(:,:,5) = rgb2gray(imread('68h.jpg'));
img_completa(:,:,6) = rgb2gray(imread('75h.jpg'));
img_completa(:,:,7) = rgb2gray(imread('144h.jpg'));

for i = 1:7
  r3(:,:,i) = rangefilt(img_completa(:,:,i));
end

figure(1)
for sb = 1:4
subplot(2,2,sb)
imshow(r3(:,:,sb))
end

figure(2)
for sb = 5:7
subplot(1,3,sb-4)
imshow(r3(:,:,sb))
end
