# Apresentação: Julia para Estatística Multivariada

### Preliminares

_Objetivo_: Fazer uma pequena discussão sobre quando a linguagem Julia é mais indicada e quando não é. Como instalar, bem como utilização e funcionalidades básicas. Como referência, recomendo acessar a [página oficial da linguagem](https://julialang.org) pois ela contém muitos recursos úteis e interessantes.
- **Instalação**: Basta seguir as instruções da [página de downloads ](https://julialang.org/downloads/). As instruções são bem simples, até mesmo para as distribuições mais populares de Linux, uma vez que basta realizar o download dos compilados genéricos.

- **REPL** _(Read Eval Print Loop)_: É a interface padrão para executar código Julia. Funciona como um console interativo. Possui 4 modos de operação, acessíveis por um comando de tecla única: padrão, ajuda (**?**), shell (**;**), gerenciador de pacotes (**]**)

- **Juno IDE**: Ambiente integrado para desenvolvimento em Julia. É o recomendado pelos desenvolvedores e contribuidores da linguagem como um todo. Quem está acostumado com o RStudio provavelmente vai preferir desenvolver nesse ambiente. Recomendo acessar a [página oficial do projeto](http://junolab.org/) para ver com maior profundidade o que é oferecido pelo sistema. A instalação é bem simples, mas como o projeto é voltado para desenvolvimento em Julia, as [instruções de instalação](http://docs.junolab.org/latest/man/installation.html) também contém instruções a partir da instalação da própria linguagem Julia.

- **IJulia**: Ambiente que mistura texto e código de maneira agradável. Funciona através do Jupyter notebook. Para quem já utiliza esse ambiente é uma ótima opção porque é razoavelmente simples de instalar nesse caso. Para quem não tem, pode ter alguma dificuldade com a instalação. De qualquer maneira, é recomendável seguir as [instruções de instalação contidas aqui](https://github.com/JuliaLang/IJulia.jl/blob/master/README.md). Alternativamente, é possível utilizar o ambiente IJulia diretamente do browser, sem nem mesmo instalar o Julia, através do [Juliabox](https://juliabox.com), que é um serviço possível de ser utilizado em modo gratuito, mas é recomendável utilizar apenas para aprendizado da linguagem, uma vez que o serviço é lento nessa modalidade.

### Conteúdo

Se encontra dividido em 3 tópicos (e cadernos) separados:

- [**Preliminares**](https://github.com/fabio-reale/julia-presentation/blob/master/Preliminares.ipynb): Lida com o funcionamento básico da linguagem. Inclui operadores aritméticos, tipos numéricos, strings e caracteres, definição de funções, vetores e matrizes (e aritmética matricial), tipo `Array{T, N}` e os diferentes modos de avaliação.
- [**Multiple Dispatch** e **IO**](https://github.com/fabio-reale/julia-presentation/blob/master/fileIO.ipynb): Apresentação do conceito central da linguagem do ponto de vista do usuário, o Multiple Dispatch. Começando com um exemplo simples, em seguida mostrando um exemplo em processamento de dados e finalizando com uma discussão sobre o pacote [_Distributions.jl_](https://juliastats.github.io/Distributions.jl/latest/starting.html)
- [**Componentes Principais**](https://github.com/fabio-reale/julia-presentation/blob/master/componentesprincipais.ipynb): Realizar análise de componentes principais no clássico conjunto de dados das flores de íris utilizando apenas os pacotes básicos. Em seguida o processo é repetido utilizando o principal pacote para estatística multivariada, [_MultivariateStats.jl_](https://multivariatestatsjl.readthedocs.io/en/latest/) e os resultados das implementações são comparados.

Preparei os notebooks para apresentar ao vivo. Antes da apresentação esses arquivos não apresentam células pré-computadas, mas após a apresentação eu subirei outra versão com as células computadas e com comentários adicionais. Se preferirem, eu subo versão em pdf.

### Links e recomendações gerais

A seção [_Learning_](https://julialang.org/learning/) da página oficial apresenta uma série de tutoriais online em vídeo. Pelo que entendi, todos esses tutoriais tem um IJulia notebook para acompanhar, sendo que esses notebooks estão diretamente acessíveis pelo [Juliabox](https://juliabox.com). Essa seção também apresenta outros tipos de recursos. Nesses casos eu recomendo alguma cautela. Muito mudou das primeiras versões para a versão atual. Basicamente, qualquer coisa anterior à versão 0.5 (outubro de 2016) não vale a pena. Ainda assim, prefira materiais considerando a versão 0.6 (junho de 2017).

A [documentação oficial](https://docs.julialang.org/en/v1/) é bem boa. Prefira utilizá-la pelo modo ajuda (?) para obter a documentação da versão que estiver utilizando. Por vezes, será necessário pesquisar como fazer algo pelo Google e é comum que essas buscas levem à documentação oficial. Nesses casos, é bom verificar a versão que foi acessada. Nos casos em que a busca mostra páginas do Stack Overflow, fórums e afins, a probabilidade do que se diz não ser mais relevante é enorme, recomendo utilizar um filtro por data.

O [Fórum de discussão oficial](https://discourse.julialang.org/) tem uma seção dedicada a questões de utilização de principiantes. É bem civilizado e costumam responder rapidamente.
