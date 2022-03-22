


%% Calculo do erro por tentativa

 close all;
clear all;
clc;

%% Trás os arquivos

% load('Coleta_Eric.mat');
% ErroTrajetoria(Coleta_Eric, ' - Coleta Voluntário',1);
% load('Coleta_Ronaldo.mat');
% ErroTrajetoria(Coleta_Ronaldo, ' - Coleta Controle',1);
% load('Coleta_Thatiane.mat');
% ErroTrajetoria(Coleta_Thatiane, ' - Coleta Controle',2);
% load('Coleta_Amanda.mat');
% ErroTrajetoria(Coleta_Amanda, ' - Coleta Voluntário',2);
% load('Coleta_Eber.mat');
% ErroTrajetoria(Coleta_Eber, ' - Coleta Voluntário',3);
% load('Coleta_Tulio.mat');
% ErroTrajetoria(Coleta_Tulio, ' - Coleta Voluntário',3);
load('Coleta_Eduardo.mat');
ErroTrajetoria(Coleta_Eduardo, ' - Coleta Controle',4);
% load('Coleta_Vinicius.mat');
% ErroTrajetoria(Coleta_Vinicius, ' - Coleta Controle',4);
% load('Coleta_Ruben.mat');
% ErroTrajetoria(Coleta_Ruben, ' - Coleta Voluntário',5);
% load('Coleta_Pedro.mat');
% ErroTrajetoria(Coleta_Pedro, ' - Coleta Controle',5);

function ErroTrajetoria = ErroTrajetoria(Coleta, titulo, f) % (Coleta.mat, título do plot, numero da figura)
cont = 0;
%% Calcula o erro do trajeto inteiro
% for k=1:13 % 13 bloco
%     erro_tentativa = [];
%     for j=1:50 % 50 alcances
%         dados = Coleta_Amanda(k,j);
%         x = dados(:,1);
%         %y = dados(:,2);
%
%         for i=1:length(x{1,1})
%             erroX = abs(x{1,1}(i,1) - 160);
%             erro_tentativa = [erro_tentativa; erroX x{1,1}(i,2) cont];
%             cont = cont + 1;
%         end
% %         hold on;
% %         subplot(13,1,k);
% %         plot(erro_tentativa(:,3),erro_tentativa(:,1));
% %         %ylim([-1 200]);
% %         %xlim([0 350]);
%
%     end
%     hold on;
%      %   subplot(3,1,k);
%         plot(erro_tentativa(2500:end,3),erro_tentativa(2500:end,1));
%         xlim([2500 inf]);
%         ylim([-1 180]);
%
%  %   cont = 0;
% end

%% Calculo o máximo erro por alcance
a = 49;
maxErro_tentativa = [];
for k=1:13 % 13 bloco
    
    for j=2:50 % 50 alcances
        dados = Coleta(k,j);
        x = dados(:,1);
        %y = dados(:,2);
        erro_tentativa = [];
        for i=1:length(x{1,1})
            erroX = abs(x{1,1}(i,1) - 160);
            erro_tentativa = [erro_tentativa; erroX x{1,1}(i,2) i];
            
        end
        maxErro_tentativa = [maxErro_tentativa; max(erro_tentativa(:,1))*0.07 cont];
        % maxErro_tentativa = [maxErro_tentativa; max(erro_tentativa(find(erro_tentativa(:,1)<160))) cont];
        cont = cont + 1;
        %         hold on;
        %         subplot(13,1,k);
        %         plot(erro_tentativa(:,3),erro_tentativa(:,1));
        %         %ylim([-1 200]);
        %         %xlim([0 350]);
        
    end
    hold on;
    %   subplot(3,1,k);

    figure(f)
%     shadedErrorBar(maxErro_tentativa(:,2), maxErro_tentativa(:,1),{@mean, @std},'lineprops', '-r','transparent',false,'patchSaturation',0.075);
    %plotshaded(maxErro_tentativa(:,2), maxErro_tentativa(:,1),'r');
    %fill(maxErro_tentativa(:,2), maxErro_tentativa(:,1),'r')
    %patch(maxErro_tentativa(:,2),maxErro_tentativa(:,1),1,'FaceColor','r','EdgeColor','none');
     plot(maxErro_tentativa(:,2),maxErro_tentativa(:,1),'b'); % VOLTAR
%     
     xlim([0 inf]); % VOLTAR
     ylim([0 15]); % VOLTAR
      xlabel('Tentaivas');
     ylabel('Erro máximo (cm)');
    %subplot(1,3,1); %voltar
    plot(repmat(a*k,15),1:15,'k-.');
    %   cont = 0;
end
%newtitulo = strcat('Erro Máximo de cada alcance',titulo); % voltar
%suptitle(newtitulo); % voltar

% %% Gráficos de mediana e média
% % f = f + 1;
% % figure(f)
% % subplot(1,3,2); % VOLTAR
% % newtitulo = strcat('Mediana do Erro Máximo por Bloco (Adapatação, Sem visão, Readaptação)', titulo);
% % suptitle(newtitulo);
% %suptitle('Mediana do Erro Máximo por Bloco (Adapatação, Sem visão, Readaptação)' + titulo);
% hold on;
% % grid on;
% %% Bloco de adaptação 3,4 e 5  - mediana
% MediaErroAd1 = round(median(maxErro_tentativa(2*49:3*49)));
% stdAd1 = std(maxErro_tentativa(2*49:3*49));
% % stdAd1 = var(maxErro_tentativa(2*49:3*49));
% bar(3,MediaErroAd1,'c')
% errorbar(3,MediaErroAd1,stdAd1,'k')
% MediaErroAd2 = round(median(maxErro_tentativa(3*49:4*49)));
% stdAd2 = std(maxErro_tentativa(3*49:4*49));
% bar(4,MediaErroAd2,'c')
% errorbar(4,MediaErroAd2,stdAd2,'k')
% MediaErroAd3 = round(median(maxErro_tentativa(4*49:5*49)));
% stdAd3 = std(maxErro_tentativa(4*49:5*49));
% bar(5,MediaErroAd3,'c')
% errorbar(5,MediaErroAd3,stdAd3,'k')
% % legend(['test', 'c'] ['test','m'] ['test', 'r']);
% % xlim([0 13]);
% % ylim([0 120]);
 
% % figure(2)
% % hold on
% %% Bloco sem visão 6,7 e 8  - mediana
% MediaErroAd1 = round(median(maxErro_tentativa(5*49:6*49)));
% stdAd1 = std(maxErro_tentativa(5*49:6*49));
% bar(6,MediaErroAd1,'m');
% errorbar(6,MediaErroAd1,stdAd1,'k');
% MediaErroAd2 = round(median(maxErro_tentativa(6*49:7*49)));
% stdAd2 = std(maxErro_tentativa(6*49:7*49));
% bar(7,MediaErroAd2,'m');
% errorbar(7,MediaErroAd2,stdAd2,'k');
% MediaErroAd3 = round(median(maxErro_tentativa(7*49:8*49)));
% stdAd3 = std(maxErro_tentativa(7*49:8*49));
% bar(8,MediaErroAd3,'m');
% errorbar(8,MediaErroAd3,stdAd3,'k');
% xlim([0 4]);
% ylim([0 120]);
% % legend('Blocos 6,7,8 (Sem Visão)');

% % figure(3)
% % hold on
% %% Bloco de readaptação 12 e 13 - mediana
% MediaErroAd1 = round(median(maxErro_tentativa(11*49:12*49)));
% stdAd1 = std(maxErro_tentativa(11*49:12*49));
% bar(12,MediaErroAd1,'r');
% errorbar(12,MediaErroAd1,stdAd1,'k');
% MediaErroAd2 = round(median(maxErro_tentativa(12*49:13*49)));
% stdAd2 = std(maxErro_tentativa(12*49:13*49));
% bar(13,MediaErroAd2,'r');
% errorbar(13,MediaErroAd2,stdAd2,'k');
% % xlim([0 4]);
% % ylim([0 120]);
% xlim([0 15]);
% ylim([0 165]);
% 
% 
% % f = f + 1;
% % figure(f)
% subplot(1,3,3);
% hold on;
% % grid on;
% % newtitulo = strcat('Media do Erro Máximo por Bloco (Adapatação, Sem visão, Readaptação)', titulo);
% % suptitle(newtitulo);
% % %suptitle('Media do Erro Máximo por Bloco (Adapatação, Sem visão, Readaptação)' + titulo);
% % hold on
% %% Bloco de adaptação 3,4 e 5 - media
% MediaErroAd1 = round(mean(maxErro_tentativa(2*49:3*49)));
% stdAd1 = std(maxErro_tentativa(2*49:3*49));
% bar(3,MediaErroAd1,'r')
% errorbar(3,MediaErroAd1,stdAd1,'k')
% MediaErroAd2 = round(mean(maxErro_tentativa(3*49:4*49)));
% stdAd2 = std(maxErro_tentativa(3*49:4*49));
% bar(4,MediaErroAd2,'r')
% errorbar(4,MediaErroAd2,stdAd2,'k')
% MediaErroAd3 = round(mean(maxErro_tentativa(4*49:5*49)));
% stdAd3 = std(maxErro_tentativa(4*49:5*49));
% bar(5,MediaErroAd3,'r')
% errorbar(5,MediaErroAd3,stdAd3,'k')
% % xlim([0 13]);
% % ylim([0 120]);
% 
% % figure(2)
% % hold on
% %% Bloco sem visão 6,7 e 8 - media
% MediaErroAd1 = round(mean(maxErro_tentativa(5*49:6*49)));
% stdAd1 = std(maxErro_tentativa(5*49:6*49));
% bar(6,MediaErroAd1,'c');
% errorbar(6,MediaErroAd1,stdAd1,'k');
% MediaErroAd2 = round(mean(maxErro_tentativa(6*49:7*49)));
% stdAd2 = std(maxErro_tentativa(6*49:7*49));
% bar(7,MediaErroAd2,'c');
% errorbar(7,MediaErroAd2,stdAd2,'k');
% MediaErroAd3 = round(mean(maxErro_tentativa(7*49:8*49)));
% stdAd3 = std(maxErro_tentativa(7*49:8*49));
% bar(8,MediaErroAd3,'c');
% errorbar(8,MediaErroAd3,stdAd3,'k');


% figure(3)
% hold on
% %% Bloco de readaptação 12 e 13 - media
% MediaErroAd1 = round(mean(maxErro_tentativa(11*49:12*49)));
% stdAd1 = std(maxErro_tentativa(11*49:12*49));
% bar(12,MediaErroAd1,'b');
% errorbar(12,MediaErroAd1,stdAd1,'k');
% MediaErroAd2 = round(mean(maxErro_tentativa(12*49:13*49)));
% stdAd2 = std(maxErro_tentativa(12*49:13*49));
% bar(13,MediaErroAd2,'b');
% errorbar(13,MediaErroAd2,stdAd2,'k');
% xlim([5 14]);
% ylim([0 15]);
% xlabel('Blocos');
% ylabel('Média do erro máximo (cm)');
% %legend({'Blocos 3,4,5 (Adaptação)'},'FaceColor','y')
% % legend({3,'Blocos 3,4,5 (Adaptação)',7,'Blocos 6,7,8 (Sem Visão)',13,'Blocos 12,13 (Re-Adaptação)'});
end

% %% função para sombra
% function varargout = plotshaded(x,y,fstr);
% % x: x coordinates
% % y: either just one y vector, or 2xN or 3xN matrix of y-data
% % fstr: format ('r' or 'b--' etc)
% %
% % example
% % x=[-10:.1:10];plotshaded(x,[sin(x.*1.1)+1;sin(x*.9)-1],'r');
%  
% if size(y,1)>size(y,2)
%     y=y';
% end;
%  
% if size(y,1)==1 % just plot one line
%     plot(x,y,fstr);
% end;
%  
% if size(y,1)==2 %plot shaded area
%     px=[x,fliplr(x)]; % make closed patch
%     py=[y(1,:), fliplr(y(2,:))];
%     patch(px,py,1,'FaceColor',fstr,'EdgeColor','none');
% end;
%  
% if size(y,1)==3 % also draw mean
%     px=[x,fliplr(x)];
%     py=[y(1,:), fliplr(y(3,:))];
%     patch(px,py,1,'FaceColor',fstr,'EdgeColor','none');
%     plot(x,y(2,:),fstr);
% end;
%  
% alpha(.2); % make patch transparent
% end
% 
% function varargout=shadedErrorBar(x,y,errBar,varargin)
% % generate continuous error bar area around a line plot
% %
% % function H=shadedErrorBar(x,y,errBar, ...)
% %
% % Purpose 
% % Makes a 2-d line plot with a pretty shaded error bar made
% % using patch. Error bar color is chosen automatically.
% %
% %
% % Inputs (required)
% % x - vector of x values [optional, can be left empty]
% % y - vector of y values or a matrix of n observations by m cases
% %     where m has length(x);
% % errBar - if a vector we draw symmetric errorbars. If it has a size
% %          of [2,length(x)] then we draw asymmetric error bars with
% %          row 1 being the upper bar and row 2 being the lower bar
% %          (with respect to y -- see demo). ** alternatively ** 
% %          errBar can be a cellArray of two function handles. The 
% %          first defines statistic the line should be and the second 
% %          defines the error bar.
% %
% % Inputs (optional, param/value pairs)
% % 'lineProps' - ['-k' by default] defines the properties of
% %             the data line. e.g.:    
% %             'or-', or {'-or','markerfacecolor',[1,0.2,0.2]}
% % 'transparent' - [true  by default] if true, the shaded error
% %               bar is made transparent. However, for a transparent
% %               vector image you will need to save as PDF, not EPS,
% %               and set the figure renderer to "painters". An EPS 
% %               will only be transparent if you set the renderer 
% %               to OpenGL, however this makes a raster image.
% % 'patchSaturation'- [0.2 by default] The saturation of the patch color.
% %
% %
% %
% % Outputs
% % H - a structure of handles to the generated plot objects.
% %
% %
% % Examples:
% % y=randn(30,80); 
% % x=1:size(y,2);
% %
% % 1)
% % shadedErrorBar(x,mean(y,1),std(y),'lineprops','g');
% %
% % 2)
% % shadedErrorBar(x,y,{@median,@std},'lineprops',{'r-o','markerfacecolor','r'});
% %
% % 3)
% % shadedErrorBar([],y,{@median,@(x) std(x)*1.96},'lineprops',{'r-o','markerfacecolor','k'});
% %
% % 4)
% % Overlay two transparent lines:
% % clf
% % y=randn(30,80)*10; 
% % x=(1:size(y,2))-40;
% % shadedErrorBar(x,y,{@mean,@std},'lineprops','-r','transparent',1);
% % hold on
% % y=ones(30,1)*x; y=y+0.06*y.^2+randn(size(y))*10;
% % shadedErrorBar(x,y,{@mean,@std},'lineprops','-b','transparent',1);
% % hold off
% %
% %
% % Rob Campbell - November 2009
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Parse input arguments
% narginchk(3,inf)
% 
% params = inputParser;
% params.CaseSensitive = false;
% params.addParameter('lineProps', '-k', @(x) ischar(x) | iscell(x));
% params.addParameter('transparent', true, @(x) islogical(x) || x==0 || x==1);
% params.addParameter('patchSaturation', 0.2, @(x) isnumeric(x) && x>=0 && x<=1);
% 
% params.parse(varargin{:});
% 
% %Extract values from the inputParser
% lineProps =  params.Results.lineProps;
% transparent =  params.Results.transparent;
% patchSaturation = params.Results.patchSaturation;
% 
% if ~iscell(lineProps), lineProps={lineProps}; end
% 
% 
% %Process y using function handles if needed to make the error bar dynamically
% if iscell(errBar) 
%     fun1=errBar{1};
%     fun2=errBar{2};
%     errBar=fun2(y);
%     y=fun1(y);
% else
%     y=y(:).';
% end
% 
% if isempty(x)
%     x=1:length(y);
% else
%     x=x(:).';
% end
% 
% 
% %Make upper and lower error bars if only one was specified
% if length(errBar)==length(errBar(:))
%     errBar=repmat(errBar(:)',2,1);
% else
%     s=size(errBar);
%     f=find(s==2);
%     if isempty(f), error('errBar has the wrong size'), end
%     if f==2, errBar=errBar'; end
% end
% 
% if length(x) ~= length(errBar)
%     error('length(x) must equal length(errBar)')
% end
% 
% 
% %Log the hold status so we don't change
% initialHoldStatus=ishold;
% if ~initialHoldStatus, hold on,  end
% 
% H = makePlot(x,y,errBar,lineProps,transparent,patchSaturation);
% 
% if ~initialHoldStatus, hold off, end
% 
% if nargout==1
%     varargout{1}=H;
% end
% 
% 
% 
% function H = makePlot(x,y,errBar,lineProps,transparent,patchSaturation)
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % Plot to get the parameters of the line
% 
%     H.mainLine=plot(x,y,lineProps{:});
% 
% 
%     % Work out the color of the shaded region and associated lines.
%     % Here we have the option of choosing alpha or a de-saturated
%     % solid colour for the patch surface.
%     mainLineColor=get(H.mainLine,'color');
%     edgeColor=mainLineColor+(1-mainLineColor)*0.55;
% 
%     if transparent
%         faceAlpha=patchSaturation;
%         patchColor=mainLineColor;
%     else
%         faceAlpha=1;
%         patchColor=mainLineColor+(1-mainLineColor)*(1-patchSaturation);
%     end
% 
% 
%     %Calculate the error bars
%     uE=y+errBar(1,:);
%     lE=y-errBar(2,:);
% 
% 
%     %Add the patch error bar
% 
% 
% 
%     %Make the patch
%     yP=[lE,fliplr(uE)];
%     xP=[x,fliplr(x)];
% 
%     %remove nans otherwise patch won't work
%     xP(isnan(yP))=[];
%     yP(isnan(yP))=[];
% 
% 
%     if(isdatetime(x))
%         H.patch=patch(datenum(xP),yP,1,'HandleVisibility','off');
%     else
%         H.patch=patch(xP,yP,1,'HandleVisibility','off');
%     end
% 
%     set(H.patch,'facecolor',patchColor, ...
%         'edgecolor','none', ...
%         'facealpha',faceAlpha)
% 
% 
%     %Make pretty edges around the patch. 
%     H.edge(1)=plot(x,lE,'-','color',edgeColor,'HandleVisibility','off');
%     H.edge(2)=plot(x,uE,'-','color',edgeColor,'HandleVisibility','off');
% 
% 
% 
%     uistack(H.mainLine,'top') % Bring the main line to the top
% end
% end