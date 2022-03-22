%%  extrair dados da tabela
clear all;
close all;
clc;
load("Coleta_Amanda.mat");
Ymax = 0;
for j=1:50
    dados = Coleta_Amanda{1,j};
    % figure(1)
    % title = '1';
    %plot(dados(:,1),dados(:,2))
    x = dados(:,1);
    y = dados(:,2);

    %% calculo da media
    matrizDeMedia = [];
    for i=min(y):max(y)
        % encontre todo y = i
        [rows,cols,vals]  = find(y == i);
        if(~isempty(rows)) %Se posição do vetor está vazaio
            mediaX = round(mean(x(rows))); % media dos x's para y = i (round = arredonda)
    %                 mediaC1 = round(abs(2048 - mean(c1(rows))));
    %                 mediaC2 = round(abs(2048 - mean(c2(rows))));
%                      if (isnan(mediaX)) % Se não existe dado na posição
%                          ii = i - 1;
%                          mediaX = matrizDeMedia(ii,1); % resgata a ultima posição
% %                         mediaC1 = matrizDeMedia(ii,3);
% %                         mediaC2 = matrizDeMedia(ii,4);
%                      end
                    matrizDeMedia = [matrizDeMedia; mediaX i];% mediaC1 mediaC2 round(mediaC1+mediaC2/2)];
        else
            matrizDeMedia = [matrizDeMedia; matrizDeMedia(i- min(y),1) i];
        end
        if(i > Ymax)
            Ymax = i;
        end
    end
    %matrizDeMedia = matrizDeMedia';
    coleta{j} = matrizDeMedia;
    %% plot da coisa
    hold on;
    plot(matrizDeMedia(:,1),matrizDeMedia(:,2), '-', 'Color', [0 j/50.0 0]);
end
cont = 0;
MediaTrajetoria = [];
for i=0:Ymax
    for z = 1:length(coleta)
        dados = coleta{1,z};
   
       x = dados(:,1);
       y = dados(:,2);
       [rows,cols,vals]  = find(y == i);
       if(~isempty(rows)) %Se posição do vetor está vazaio
            mediaX = mediaX + round(mean(x(rows))); % media dos x's para y = i (round = arredonda)
            cont = cont + 1;
       end
    end
   x1 = round(mediaX/cont);
   MediaTrajetoria = [MediaTrajetoria; x1 i];
   mediaX = 0;
   cont = 0;
end
plot(MediaTrajetoria(:,1),MediaTrajetoria(:,2), '-', 'Color', [1 0 0],'LineWidth', 2);