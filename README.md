Dashboard de Análise de Satisfação dos Funcionários

Este repositório contém um dashboard desenvolvido no Power BI para analisar os resultados da pesquisa de satisfação dos funcionários.

🗂️ Dados:

Fonte: Planilha do Excel.

Tratamento: Feito com linguagem M diretamente no Power Query.
Medidas: Criadas com DAX.
📊 Funcionalidades:

Análise Geral de Satisfação: Visão abrangente da satisfação dos funcionários por áreas da empresa.
Detalhamento por Categorias: Insights específicos em categorias como Suporte, Desenvolvimento, Liderança, Comunicação, etc.
Comparação de Resultados: Gráficos que comparam resultados obtidos versus esperados.

![image](https://github.com/user-attachments/assets/78f60b1c-cfc3-4cfb-8597-f5149e18d0e6)

![image](https://github.com/user-attachments/assets/a786c6ef-bfdc-4029-a2c4-ff675e0ebb2b)

![image](https://github.com/user-attachments/assets/96e5d2f3-aaf2-4d77-90a3-837716eef1b1)



📈 Objetivo:

Fornecer uma ferramenta visual e interativa que ajude a identificar pontos fortes e áreas de melhoria na satisfação dos funcionários, auxiliando na tomada de decisões estratégicas para um ambiente de trabalho mais saudável e produtivo. Inclui painéis de filtros e botões de navegação entre páginas.

🛠️ Tecnologias Utilizadas:

Power BI
Linguagem M
DAX
Excel.



⚙️Modelagem:
 Tratamento de Dados no Power Query
![image](https://github.com/user-attachments/assets/5520c623-5416-45e7-a566-0aadadcc8cc4)


 Planilha após tratamento na linguagem M:
![image](https://github.com/user-attachments/assets/550134a7-c26e-4394-bc77-687a37e49f5c)




Utilizei o Power Query para transformar os dados brutos da pesquisa de satisfação dos funcionários. Originalmente, os dados estavam distribuídos em 30 colunas diferentes, cada uma representando uma pergunta. Através do script, desagrupei essas colunas em linhas, consolidando as respostas em apenas 6 colunas principais: Área, Pergunta, Resposta, Categoria, Resp_Relevante e Peso.

Essa transformação simplificou a análise, permitindo uma visão mais clara e categorizada dos resultados, facilitando a criação do dashboard no Power BI.


📂 Estrutura do Repositório:

Data/: Contém os datasets utilizados.
Dashboard/: Arquivo do Power BI.
Linguagem.M/: Codigo M explicado.
Dax/: Medidas DAX usadas e explicadas.



 
