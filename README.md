# Apresentação: Julia para Estatística Multivariada

### Preliminares

Objetivo: Fazer uma pequena discussão sobre quando a linguagem Julia é mais indicada e quando não é. Como instalar, bem como utilização e funcionalidades básicas. Como referência, recomendo acessar a [página oficial da linguagem](https://julialang.org) pois ela contém muitos recursos úteis e interessantes.
- **Instalação**: Basta seguir as instruções da [página de downloads ](https://julialang.org/downloads/). As instruções são bem simples, até mesmo para as distribuições mais populares de Linux, uma vez que basta realizar o download dos compilados genéricos.

- **REPL** _(Read Eval Print Loop)_: É a interface padrão para executar código Julia. Funciona como um console interativo. Possui 4 modos de operação, acessíveis por um comando de tecla única: padrão, ajuda (**?**), shell (**;**), gerenciador de pacotes (**]**)

- **IJulia**: Ambiente que mistura texto e código de maneira agradável. Funciona através do Jupyter notebook. Para quem já utiliza esse ambiente é uma ótima opção porque é razoavelmente simples de instalar nesse caso. Para quem não tem, pode ter alguma dificuldade com a instalação. De qualquer maneira, é recomendável seguir as [instruções de instalação contidas aqui](https://github.com/JuliaLang/IJulia.jl/blob/master/README.md). Alternativamente, é possível utilizar o ambiente IJulia diretamente do browser, sem nem mesmo instalar o Julia, através do [Juliabox](https://juliabox.com), que é um serviço possível de ser utilizado em modo gratuito, mas é recomendável utilizar apenas para aprendizado da linguagem, uma vez que o serviço é lento nessa modalidade.

- **Juno IDE**: Ambiente integrado para desenvolvimento em Julia. É o recomendado pelos desenvolvedores e contribuidores da linguagem como um todo. Quem está acostumado com o RStudio provavelmente vai preferir desenvolver nesse ambiente. Recomendo acessar a [página oficial do projeto](http://junolab.org/) para ver com maior profundidade o que é oferecido pelo sistema. A instalação é bem simples, mas como o projeto é voltado para desenvolvimento em Julia, as [instruções de instalação](http://docs.junolab.org/latest/man/installation.html) também contém instruções a partir da instalação da própria linguagem Julia.

### Multiple Dispatch

Apresentar o maior diferencial da linguagem através de um exemplo simples.

### Leitura de dados

Apresentar funcionalidade básica para importar dados. Em seguida, se aproveitar do multiple dispatch para processar dados de natureza distinta de maneira distinta com mínimo esforço.

### Aplicação

Mostrar e discutir implementação de um método componentes_principais() utilizando apenas as ferramentas de álgebra linear que fazem parte do pacote básico.

### Aplicação2

Apresentar o principal pacote estatístico e comparar os resultados da implementação anterior com a função **PCA( )** desse pacote.
