%{
SOFTWARE PARA PROCESSSAR DADOS RECOLHIDOS DE COLETA
ARQUIVOS EM .TXT
Data: 09/06/19

Eng. Vinicius Teixeira da Costa
Email: viniciustxc@yahoo.com.br             Cel: +55 34 99255-1167
%}
%% FASES DO PROCESSAMENTO:
%{
-   Abrir arquivos, organizar em células (50 tentativas / 13 Blocos);
-   
%}
%% Limpando memério para iniciar
clear all;
clc;

%% Organiza em células as coletas

% Coleta_Amanda = Organiza_Celulas('Mapeamento_AmandaR.txt'); % Coleta Amanda Rosa
%  Coleta_Eber = Organiza_Celulas('Mapeamento_Eber.txt'); % Coleta Eber
%  Coleta_Eduardo = Organiza_Celulas('Mapeamento_Eduardo.txt'); % Coleta Eduardo
%  Coleta_Eric = Organiza_Celulas('Mapeamento_Eric.txt'); % Coleta Eric
%  Coleta_Pedro = Organiza_Celulas('Mapeamento_Pedro.txt'); % Coleta Pedro
%  Coleta_Ronaldo = Organiza_Celulas('Mapeamento_Ronaldo.txt'); % Coleta Ronaldo
  Coleta_Ruben = Organiza_Celulas('Mapeamento_Ruben.txt'); % Coleta Ruben
%  Coleta_Thatiane = Organiza_Celulas('Mapeamento_Thatiane.txt'); % Coleta Thatiane
%  Coleta_Tulio = Organiza_Celulas('Mapeamento_Tulio.txt'); % Coleta Tulio
%  Coleta_Vinicius = Organiza_Celulas('Mapeamento_Vinicius.txt'); % Coleta Vinicius
%% Salva em .mat
% save('Coleta_Amanda.mat','Coleta_Amanda');
%  save('Coleta_Eber.mat','Coleta_Eber');
%  save('Coleta_Eduardo.mat','Coleta_Eduardo');
%  save('Coleta_Eric.mat','Coleta_Eric');
%  save('Coleta_Pedro.mat','Coleta_Pedro');
%  save('Coleta_Ronaldo.mat','Coleta_Ronaldo');
  save('Coleta_Ruben.mat','Coleta_Ruben');
%  save('Coleta_Thatiane.mat','Coleta_Thatiane');
%  save('Coleta_Tulio.mat','Coleta_Tulio');
%  save('Coleta_Vinicius.mat','Coleta_Vinicius');

%% Função que organiza Células
function Celula = Organiza_Celulas(arquivotxt) % Organiza em células os arquivos txt da coleta (13 blocos e 50 tentativas)
    linhas_excluidas = 14; % Caebeçalho
    for bloco=1:13 % Divide em 13 blocos
        for alcance=1:50   % Divide em 50 alcances
            arquivo = importdata(arquivotxt, ' ', linhas_excluidas); % Abre o arquivo, separando os dados por ' ' (espaço) e exclui leitura dos dados iniciais
            [l c] = size(arquivo.data); % Contagem das linhas
            linhas_excluidas = linhas_excluidas + l + 3; % Soma como linhas a serem excluidas
            Celula{bloco,alcance} = arquivo.data; % salva em uma célula
        end
        linhas_excluidas = linhas_excluidas + 3; % Soma linhas do novo bloco
    end
end



