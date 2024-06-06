function final = nucleos(img)

%Elementos estruturantes em cruz, para operações morfológicas
ee1 = [0 1 0; 1 1 1; 0 1 0];
ee2 = [0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];

%Transformando imagem e removendo ruidos
binaria = imbinarize(rgb2gray(img),'adaptive','ForegroundPolarity','dark','Sensitivity',0.90); %destacar os nucleos
fechamento = imclose(binaria,ones(9,9));  %preencher os nucleos
erosao = imerode(fechamento,ee1);  %remover ruidos
final = erosao;

figure
subplot(1,4,1)
imshow(img)
title('Entrada')

subplot(1,4,2)
imshow(binaria)
title('Binarização')

subplot(1,4,3)
imshow(fechamento)
title('Fechamento')

subplot(1,4,4)
imshow(erosao)
title('Erosão')