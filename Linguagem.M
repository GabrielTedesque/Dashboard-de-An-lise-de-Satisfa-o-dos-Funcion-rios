Código M para Tratamento de Dados no Power Query

'Este script M foi utilizado para tratar os dados da pesquisa de satisfação dos funcionários no Power Query. Abaixo está a explicação passo a passo de cada etapa do código:'


Fonte = Excel.Workbook(File.Contents("C:\Users\gabri\OneDrive\Ambiente de Trabalho\BI\ARQUIVO\Teste Analista de Dados.xlsx"), null, true),
Tabela1_Table = Fonte{[Item="Tabela1",Kind="Table"]}[Data],
  Carrega os dados da planilha Excel localizada no caminho especificado e seleciona a tabela chamada "Tabela1".


Desagrupar Colunas:
Desagrupar = Table.UnpivotOtherColumns(Tabela1_Table, {"ID", "Área"}, "Pergunta", "Resposta"),
  Desagrupa as colunas de perguntas, mantendo as colunas "ID" e "Área" fixas e transformando as demais colunas em linhas com colunas "Pergunta" e "Resposta".

Renomear Colunas:
RenomearColunas = Table.RenameColumns(Desagrupar, {{"Pergunta", "Pergunta"}, {"Resposta", "Resposta"}}),
  Renomeia as colunas resultantes para "Pergunta" e "Resposta".

Alterar Tipo de Colunas:
#"Tipo Alterado" = Table.TransformColumnTypes(RenomearColunas,{{"Resposta", type text}, {"Pergunta", type text}, {"Área", type text}}),
  Altera o tipo das colunas "Resposta", "Pergunta" e "Área" para texto.

Remover Coluna "ID":
#"Colunas Removidas" = Table.RemoveColumns(#"Tipo Alterado",{"ID"}),
  Remove a coluna "ID" por não ser necessária na análise.

Adicionar Coluna de Categoria:
AdicionarCategoria = Table.AddColumn(#"Colunas Removidas", "Categoria", each 
     if [Pergunta] = "A Empresa Xis me fornece os treinamentos necessários para realizar meu trabalho." then "Desenvolvimento" 
     ...
     else null),

Adiciona uma coluna "Categoria" baseada nas perguntas, classificando-as em diferentes categorias como "Desenvolvimento", "Reconhecimento", "Remuneração", etc.
  Adicionar Coluna de Respostas Relevantes:

AdicionarResp = Table.AddColumn(AdicionarCategoria, "Resp", each 
     if [Resposta] = "Concordo totalmente" or [Resposta] = "Concordo" or [Resposta] = "Não concordo nem discordo" or [Resposta] = "Discordo" or [Resposta] = "Discordo totalmente" then [Resposta]
     else "Não aplicável"),
A  diciona uma coluna "Resp" que filtra apenas as respostas relevantes (como "Concordo totalmente", "Concordo", etc.) e marca outras como "Não aplicável".

Adicionar Coluna de Peso:
AdicionarPeso = Table.AddColumn(AdicionarResp, "Peso", each 
     if [Resp] = "Concordo totalmente" then 5
     else if [Resp] = "Concordo" then 4
     else if [Resp] = "Não concordo nem discordo" then 3
     else if [Resp] = "Discordo" then 2
     else if [Resp] = "Discordo totalmente" then 1
     else 0),
  Adiciona uma coluna "Peso" que atribui valores numéricos às respostas relevantes, variando de 5 para "Concordo totalmente" a 1 para "Discordo totalmente".

Alterar Tipo de Colunas:
#"Tipo Alterado1" = Table.TransformColumnTypes(AdicionarPeso,{{"Categoria", type text}, {"Resp", type text}, {"Peso", Int64.Type}}),
  Altera o tipo das colunas "Categoria", "Resp" e "Peso".

Renomear Coluna "Resp" para "Resp_Relevante":
#"Colunas Renomeadas" = Table.RenameColumns(#"Tipo Alterado1",{{"Resp", "Resp_Relevante"}})
  Renomeia a coluna "Resp" para "Resp_Relevante".

Finalização:
in
#"Colunas Renomeadas"
Retorna a tabela final com todas as transformações aplicadas.



