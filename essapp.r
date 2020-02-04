################################################################################
##
## ****** EASY SAMPLE SIZE APP ******
## Author: Thiago Rezende
## EASY SAMPLE SIZE PROJECT
## Federal University of Minas Gerais
## Date: dez-2019
## All rights reserved @2019
##
################################################################################
library(shiny)
library(shinythemes)
ui <- fluidPage(theme=shinytheme("flatly") ,
  titlePanel(h1("EASY SAMPLE SIZE CALCULATOR"), windowTitle="Easy Sample Size Calculator"),
    tags$h1(tags$style(".titlePanel{ color: green;font-size: 20px;font-style: italic;}")),
  tags$h6("Se voce usar este WEBSITE, por favor o CITE em seus trabalhos como: 'SANTOS, T. R. e QUININO, R. C. e TAVARES, R. (2019) Easy Sample Size Project (ESSP).Disponivel em: <http://est.ufmg.br/~thiagords/ESSP.htm>. Acesso em: [data do acesso].'"),  
navlistPanel(
    "TECNICAS ESTATISTICAS", 
    "Estimacao: Intervalos de Confianca",
    tabPanel("Para 1 Proporcao",
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para Uma Proporcao"),
               sidebarPanel(
                 numericInput(inputId = "d.1",
                              label = "margem de erro",
                              value = 0.03,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "p.1",
                              label = "Proporcao (estimativa)",
                              value = 0.5,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "conf.1",
                              label = "Nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("one.sided.1", "Intervalo unilateral", FALSE),
                 checkboxInput("cc.1", "Correcao de continuidade", FALSE),
                 checkboxInput("fpc1", "Correcao para populacao finita", FALSE),
                 conditionalPanel(
                   condition="input.fpc1 == true",
                   numericInput(inputId = "N.1",
                                label = "Tamanho da populacao",
                                value = 10000,
                                min = 0,
                                step = 100
                   ))
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.1")
               )
             ))),
    tabPanel("Para 2 Proporcoes",
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para a Diferenca de Duas Proporcoes"),
               sidebarPanel(
                 numericInput(inputId = "precision.122",
                              label = "margem de erro",
                              value = 0.03,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "p.122",
                              label = "Proporcao Pop. 1 (estimativa)",
                              value = 0.5,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "p2.122",
                              label = "Proporcao Pop. 2 (estimativa)",
                              value = 0.5,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "conf.122",
                              label = "Nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.122", "Intervalo bilateral", TRUE),
                 checkboxInput("cc.122", "Correcao de continuidade", TRUE),
                 checkboxInput("fpc122", "Correcao para populacao finita", TRUE),
                 conditionalPanel(
                   condition="input.fpc122 == true",
                   numericInput(inputId = "N.122",
                                label = "Tamanho da populacao",
                                value = 10000,
                                min = 0,
                                step = 100
                   ))
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.122")
               )
             ))),             
    tabPanel("Para 1 Media", # 2
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para Uma Media"),
               sidebarPanel(
                 numericInput(inputId = "d.2",
                              label = "margem de erro",
                              value = 10,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "sd.2",
                              label = "Desvio padrao",
                              value = 15,
                              min = 0
                 ),
                 numericInput(inputId = "conf.2",
                              label = "nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("one.sided.2", "Intervalo unilateral", FALSE),
                 checkboxInput("sd.known.2", "Desvio padrao conhecido", TRUE),
                 checkboxInput("fpc2", "Correcao para populacao finita", FALSE),
                 conditionalPanel(
                   condition="input.fpc2 == true",
                   numericInput(inputId = "N.2", label = "tamanho da populacao",
                                value = 10000, min = 0, step = 100))
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.2")
               )
             ))),
    tabPanel("Para 2 Medias", # 2
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para a Diferenca de Duas Medias"),
               sidebarPanel(
                 numericInput(inputId = "precision.222",
                              label = "margem de erro",
                              value = 10,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "sd1.222",
                              label = "Desvio padrao da amostra piloto (Pop. 1)",
                              value = 15,
                              min = 0,
                              max = 1000000,
                              step = 1
                 ),
                 numericInput(inputId = "sd2.222",
                              label = "Desvio padrao da amostra piloto (Pop. 2)",
                              value = 15,
                              min = 0,
                              max = 1000000,
                              step = 1
                 ),
                 numericInput(inputId = "n1.222",
                                label = "Tamanho da amostra piloto (Pop. 1)",
                                value = 20,
                                min = 2,
                                step = 10,
                                max = 5000
                   ),
                   numericInput(inputId = "n2.222",
                                label = "Tamanho da amostra piloto (Pop. 2)",
                                value = 20,
                                min = 2,
                                step = 10,
                                max = 5000
                   ),  
                 numericInput(inputId = "conf.222",
                              label = "nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ), 
                 checkboxInput("two.sided.222", "Intervalo bilateral", TRUE),
                 checkboxInput("knownv.222", "Desvio padrao conhecido", TRUE),
                 checkboxInput("equalv.222", "Variancias Iguais", TRUE),
                checkboxInput("fpc222", "Populacao finita", FALSE),
                 conditionalPanel(
                   condition="input.fpc222 == true",
                   numericInput(inputId = "N.222",
                                label = "Tamanho da populacao",
                                value = 10000,
                                min = 0,
                                step = 100
                   )) 
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.222")
               )
             ))),
    tabPanel("Para 1 Variancia (Populacao Normal)",
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para Uma Variancia (Populacao Normal)"),
               sidebarPanel(
                 numericInput(inputId = "width.333",
                              label = "Amplitude do intervalo",
                              value = 5
                 ),
                 numericInput(inputId = "variance.333",
                              label = "Variancia (estimativa)",
                              value = 15,
                              min = 0
                 ),
                 numericInput(inputId = "conf.333",
                              label = "Nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 )
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.333")
               )
             ))),
    tabPanel("Para 2 Variancias (Populacao Normal)",
             shinyUI(pageWithSidebar(
               headerPanel("Intervalo de Confianca para Duas Variancias (Populacao Normal)"),
               sidebarPanel(
                 numericInput(inputId = "re.322",
                              label = "Margem de erro relativa",
                              value = 0.1,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "conf.322",
                              label = "Nivel de confianca",
                              value = 0.95,
                              min = 0,
                              max = 1,
                              step = 0.01
                 )
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.322")
               )
             ))),             
    "Testes de Hipoteses Parametricos",
    tabPanel("Para 1 Proporcao",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Uma Proporcao"),
               sidebarPanel(
                 numericInput(inputId = "p0.4",
                              label = "Proporcao (hipotese nula)",
                              value = 0.5,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "p1.4",
                              label = "Proporcao (hipotese alternativa)",
                              value = 0.6,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "sig.level.4",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.4",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.4", "Teste bilateral", FALSE),
                 checkboxInput("cc.4", "Correcao de continuidade", FALSE)
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.4")
               )
             ))),
    tabPanel("Para 2 Proporcoes",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Duas Proporcoes"),
               sidebarPanel(
                 numericInput(inputId = "p1.5",
                              label = "Proporcao 1",
                              value = 0.5,
                              min = 0,
                              max = 1,
                              step = 0.01)
                 
                 ,
                 numericInput(inputId = "p2.5",
                              label = "Proporcao 2",
                              value = 0.6,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "sig.level.5",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.5",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.5", "Teste bilateral", TRUE),
                 checkboxInput("cc.5", "Correcao de continuidade", FALSE)
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.5")
               )) )),
    tabPanel("Para 1 Media",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Uma Media"),
               sidebarPanel(
                 numericInput(inputId = "d.6",
                              label = "Diferenca",
                              value = 5
                 ),
                 numericInput(inputId = "sd.6",
                              label = "Desvio padrao",
                              value = 15,
                              min = 0
                 ),
                 numericInput(inputId = "sig.level.6",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.6",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.6", "teste bilateral", TRUE),
                 checkboxInput("sd.known.6", "desvio padrao conhecido", TRUE)
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.6")
               )
             ))),
    tabPanel("Para 2 Medias",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Duas Medias"),
               sidebarPanel(
                 numericInput(inputId = "d.7",
                              label = "diferenca",
                              value = 5
                 ),
                 numericInput(inputId = "sd1.7",
                              label = "Desvio padrao (Populacao 1)",
                              value = 15,
                              min = 0
                 ),
                 numericInput(inputId = "sd2.7",
                              label = "Desvio padrao (Populacao 2)",
                              value = 15,
                              min = 0
                 ),
                 numericInput(inputId = "sig.level.7",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.7",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.7", "Teste bilateral", TRUE),
                 checkboxInput("sd.known.7", "Desvios padrao conhecidos", TRUE)
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.7")
               )
             ))),
    tabPanel("Para 1 Variancia",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Uma Variancia"),
               sidebarPanel(
                 numericInput(inputId = "sigma20.6v",
                              label = "Variancia em H0",   
                              value = 2,
                              min = 0.01,
                              max = 10000000,
                              step = 1
                 ),
                 numericInput(inputId = "sigma21.6v",
                              label = "Variancia (effect size)",
                              value = 1,
                              min = 0.01,
                              max = 10000000,
                              step = 1
                 ),
                 numericInput(inputId = "alpha.6v",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.6v",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.6v", "teste bilateral", TRUE),
                 checkboxInput("rrc.6v", "Especificar a razao", TRUE),
                 conditionalPanel(
                   condition="input.rrc.6v == true",
                   numericInput(inputId = "R.6v",
                                label = "Valor da razao",
                                value = 2,
                                 min = 0.01,
                              max = 10000000,
                              step = 1
                   ))
                ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.6v")
               )
             ))),
    tabPanel("Para 2 Variancias",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Duas Variancias"),
               sidebarPanel(
               numericInput(inputId = "sigma21.7v",
                              label = "Variancia (Populacao 1)",
                               value = 2,
                              min = 0.01,
                              max = 10000000,
                              step = 1
                 ),
                 numericInput(inputId = "sigma22.7v",
                              label = "Variancia (Populacao 2)",
                              value = 1,
                              min = 0.01,
                              max = 10000000,
                              step = 1
                 ),
                 numericInput(inputId = "alpha.7v",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.7v",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.7v", "Teste bilateral", TRUE),
                             checkboxInput("rrc.7v", "Especificar a razao", TRUE),
                 conditionalPanel(
                   condition="input.rrc.7v == true",
                   numericInput(inputId = "R.7v",
                                label = "Valor da razao",
                                value = 2,
                                 min = 0.01,
                              max = 10000000,
                              step = 1
                   ))
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.7v")
               )
             ))),
          tabPanel("Para Correlacao Linear",
             shinyUI(pageWithSidebar(
               headerPanel("Teste para Correlacao Linear"),
               sidebarPanel(
                 numericInput(inputId = "r.8",
                              label = "Correlacao (Hipotese alternativa)",
                              value = 0.3,
                              min = -1,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "sig.level.8",
                              label = "Alfa",
                              value = 0.05,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 numericInput(inputId = "power.8",
                              label = "Poder",
                              value = 0.8,
                              min = 0,
                              max = 1,
                              step = 0.01
                 ),
                 checkboxInput("two.sided.8", "Teste bilateral", FALSE)
               ),
               mainPanel(
                 h3("O Tamanho da Amostra:"),
                 textOutput("resposta.8")
               )
             ))),
    tabPanel("Para Nao-Inferioridade ou Superioridade de 2 Medias",
         shinyUI(pageWithSidebar(
           headerPanel("Teste para Nao-Inferioridade ou Superioridade de 2 Medias"),
           sidebarPanel(
             numericInput(inputId = "dif.9",
                          label = "Diferenca das medias (tratamento e referencia)",
                          value = 1.5,
                          step = 0.01
             ),
             numericInput(inputId = "e.9",
                          label = "Diferenca clinicamente importante",
                          value = 0.5,
                          min = -10,
                          max = 10,
                          step = 0.01
             ),
             numericInput(inputId = "sd1.9",
                          label = "Desvio padrao (tratamento)",
                          value = 5,
                          min = 0.01,
                          step = 0.01
             ),
             numericInput(inputId = "sd2.9",
                          label = "Desvio padrao (referencia)",
                          value = 5,
                          min = 0.01,
                          step = 0.01
             ),
             numericInput(inputId = "sig.level.9",
                          label = "Alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.9",
                          label = "Poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.9", "Teste bilateral", FALSE),
             checkboxInput("sd.know.9", "Desvio padrao conhecido", FALSE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra:"),
             textOutput("resposta.9")
           )
         ))),
    tabPanel("Para Equivalencia de 2 Medias",
         shinyUI(pageWithSidebar(
           headerPanel("Teste para Equivalencia de 2 Medias"),
           sidebarPanel(
             numericInput(inputId = "dif.10",
                          label = "Diferenca das medias",
                          value = 1.5,
                          min = 0.01,
                          step = 0.01
             ),
             numericInput(inputId = "e.10",
                          label = "Diferenca clinicamente importante",
                          value = 0.5,
                          min = 0.01,
                          max = 10,
                          step = 0.01
             ),
             numericInput(inputId = "sd1.10",
                          label = "Desvio padrao (tratamento)",
                          value = 5,
                          min = 0.01,
                          step = 0.01
             ),
             numericInput(inputId = "sd2.10",
                          label = "Desvio padrao (referencia)",
                          value = 5,
                          min = 0.01,
                          step = 0.01
             ),
             numericInput(inputId = "sig.level.10",
                          label = "Alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.10",
                          label = "Poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.10", "Teste bilateral", FALSE),
             checkboxInput("sd.know.10", "Desvio padrao conhecido", FALSE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra:"),
             textOutput("resposta.10")
           )
         ))),
    tabPanel("Para Nao-Inferioridade ou Superioridade de 2 Proporcoes",
         shinyUI(pageWithSidebar(
           headerPanel("Teste para Nao-Inferioridade ou Superioridade de 2 Proporcoes"),
           sidebarPanel(
             numericInput(inputId = "p1.11",
                          label = "Proporcoes (tratamento)",
                          value = 0.5,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "p2.11",
                          label = "Proporcoes (referencia)",
                          value = 0.5,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "e.11",
                          label = "Diferenca clinicamente importante",
                          value = 0.5,
                          min = -10,
                          max = 10,
                          step = 0.01
             ),
             numericInput(inputId = "sig.level.11",
                          label = "Alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.11",
                          label = "Poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.11", "Teste bilateral", FALSE),
             checkboxInput("sd.know.11", "Desvio padrao conhecido", FALSE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra:"),
             textOutput("resposta.11")
           )
         ))),
    tabPanel("Para Equivalencia de 2 Proporcoes",
         shinyUI(pageWithSidebar(
           headerPanel("Teste para Equivalencia de 2 Proporcoes"),
           sidebarPanel(
             numericInput(inputId = "p1.12",
                          label = "Proporcao (tratamento)",
                          value = 0.5,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "p2.12",
                          label = "Proporcao (referencia)",
                          value = 0.5,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "e.12",
                          label = "Diferenca clinicamente importante",
                          value = 0.5,
                          min = 0.01,
                          max = 10,
                          step = 0.01
             ),
             numericInput(inputId = "sig.level.12",
                          label = "Alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.12",
                          label = "Poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.12", "Teste bilateral", FALSE),
             checkboxInput("sd.know.12", "Desvio padrao conhecido", FALSE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra:"),
             textOutput("resposta.12")
           ) ))),  
tabPanel("Teste de QuiQuadrado",
         shinyUI(pageWithSidebar(
           headerPanel("Teste de QuiQuadrado"),
           sidebarPanel(
             numericInput(inputId = "f.16",
                          label = "Effect Size",
                          value = 0.28,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "k.16",
                          label = "Numero de categorias nas linhas",
                          value = 4,
                          min = 1,
                          max = 100,
                          step = 1
             ),
                          numericInput(inputId = "c.16",
                          label = "Numero de categorias nas colunas",
                          value = 1,
                          min = 1,
                          max = 100,
                          step = 1
             ),
             numericInput(inputId = "sig.level.16",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.16",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             )
            ),
           mainPanel(
             h3("Tamanho Amostral: "),
             textOutput("resposta.16")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel            
"Testes Nao-Parametricos", 
tabPanel("Teste de Mann-Whitney",
         shinyUI(pageWithSidebar(
           headerPanel("Teste de Mann-Whitney"),
           sidebarPanel(
             numericInput(inputId = "Tamanho1.13",
                          label = "Tamanho amostra piloto grupo 1",
                          value = 20,
                          min = 1,
                          max = 1000000000,
                          step = 1
             ),
             numericInput(inputId = "Tamanho2.13",
                          label = "Tamanho amostra piloto grupo 2",
                          value = 20,
                          min = 1,
                          max = 1000000000,
                          step = 1
             ),
             numericInput(inputId = "e.13",
                          label = "Diferenca a ser detectada",
                          value = 0.5,
                          min = 0.01,
                          max = 10,
                          step = 0.01
             ),
             numericInput(inputId = "Var1.13",
                          label = "Variancia inicial grupo 1",
                          value = 1.0,
                          min = 0.01,
                          max = 1000000,
                          step = 1
             ),
             numericInput(inputId = "Var2.13",
                          label = "Variancia inicial grupo 2",
                          value = 1.0,
                          min = 0.01,
                          max = 1000000,
                          step = 1
             ),
             numericInput(inputId = "sig.level.13",
                          label = "Alfa",
                          value = 0.05,
                          min = 0.000000001,
                          max = 0.99999,
                          step = 0.01
             ),
             numericInput(inputId = "power.13",
                          label = "Poder",
                          value = 0.8,
                          min = 0.000000001,
                          max = 0.99999,
                          step = 0.01
             ),
             checkboxInput("two.sided.13", "teste bilateral", FALSE) ,
             checkboxInput("Tamanhosiguais","Grupos de tamanhos iguais",TRUE) 
           ),
           mainPanel(
             h3("Tamanho da Amostra:"),
             textOutput("resposta13")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel
tabPanel("Teste de Wilcoxon-Mann-Whitney",
shinyUI(pageWithSidebar(
           headerPanel("Teste de Wilcoxon-Mann-Whitney"),
           sidebarPanel(
             textInput('vecshi1.14', 'Entre  com dados Grupo 1 (delimitado por virgulas)', "315,375,356,374,412,418,445,403,431,410,391,475,379"),
             textInput('vecshi2.14', 'Entre com dados Grupo 2 (delimitado por virgulas)', "295,355,336,354,392,398,425,383,411,390,371,455,359"),
         selectInput("Dist.14", "proporcao de individuos no Grupo 1:",
      list("1/2", "min")
    ),  
              numericInput(inputId = "sig.level.14",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.14",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             )
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.14")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel
tabPanel("Teste de Spearmann (Correlacao)",
         shinyUI(pageWithSidebar(
           headerPanel("Teste de Spearmann"),
           sidebarPanel(
                      numericInput(inputId = "rho.15",
                          label = "rho (effect size)",
                          value = 0.5,
                          min = 0.0001,
                          max = 1.0000,
                          step = 0.005
             ),
             numericInput(inputId = "alpha.15",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.15",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.15", "teste bilateral", TRUE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.15")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel 
tabPanel("Teste de Kendall (Correlacao)",
         shinyUI(pageWithSidebar(
           headerPanel("Teste de Kendall"),
           sidebarPanel(
                      numericInput(inputId = "rho.15b",
                          label = "rho (effect size)",
                          value = 0.5,
                          min = 0.0001,
                          max = 1.0000,
                          step = 0.005
             ),
             numericInput(inputId = "alpha.15b",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.15b",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("two.sided.15b", "teste bilateral", TRUE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.15b")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel   
tabPanel("Teste de Kruskall-Wallis",
         shinyUI(pageWithSidebar(
           headerPanel("Teste de Kruskall-Wallis"),
           sidebarPanel(
             textInput('vecshi1', 'Entre com effect size (delimitado por virgulas)', "0,1,2"),
         selectInput("Distribuicao", "Escolha a distribuicao:",
      list("normal", "logistic")
    ),
              numericInput(inputId = "sig.level.17",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.17",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             checkboxInput("taylor.17", "Aproximacao de Taylor", FALSE)
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.17")
           )
         ) #Pagesidebar
         ) #Shinyui
         ), #tabpanel                     
"Modelos Lineares", 
tabPanel("Modelo de Regressao Linear",
         shinyUI(pageWithSidebar(
           headerPanel("Modelo de Regressao Linear"),
           sidebarPanel(
           numericInput(inputId = "b.18",
                          label = "effect size (b)",
                          value = 0.6,
                          min = -1,
                          max = 1,
                          step = 0.01
             ),
              numericInput(inputId = "sig.level.18",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.18",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "sigma2x.18",
                          label = "Estimativa da variancia de X",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.5
             ),
             numericInput(inputId = "sigma2y.18",
                          label = "Estimativa da variancia de Y",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.5
             ),
             checkboxInput("two.sided.18", "teste bilateral", TRUE),
             checkboxInput("regsimple.18", "Regressao multipla", TRUE),
             checkboxInput("varxy.18", "Especificar variancias", TRUE),
           numericInput(inputId = "corpark.18",
                          label = "Correlacao parcial",
                          value = 0.6,
                          min = -1,
                          max = 1,
                          step = 0.01
           ) 
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.18")
           )
         ) #Pagesidebar
         ) #Shinyui
         ),  
tabPanel("Modelo de Regressao Logistica",
         shinyUI(pageWithSidebar(
           headerPanel("Modelo de Regressao Logistica"),
   sidebarPanel(
            selectInput("Dist.19", "Escolha a variavel explicativa X",
                list("categorica", "continua")
            ),
           numericInput(inputId = "Oddsb.19",
                         label = "odds ratio (R)",
                          value = 2.35,
                          min = 0,
                          max = 10000,
                         step = 0.1
             ),
            numericInput(inputId = "P0.19",
                          label = "P0",
                          value = 0.5,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
           numericInput(inputId = "P1.19",
                          label = "P1",
                          value = 0.3,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "Phx.19",
                          label = "Proporcao da variavel categorica X",
                          value = 0.5,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
              numericInput(inputId = "siglev.19",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.19",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
              checkboxInput("two.sided.19", "teste bilateral", TRUE),
              checkboxInput("odds.19", "usar odds ratio", TRUE),
             checkboxInput("regsimple.19", "Regressao multipla", TRUE),
           numericInput(inputId = "corpark.19",
                          label = "Correlacao parcial",
                          value = 0.6,
                          min = -1,
                          max = 1,
                          step = 0.01
           ) 
           ),
           mainPanel(
             h3("Sample size (n):"),
             textOutput("resposta.19")
           )
         ) #Pagesidebar
         ) #Shinyui
         ),  
tabPanel("Modelo de Regressao Poisson",
         shinyUI(pageWithSidebar(
           headerPanel("Modelo de Regressao Poisson"),
           sidebarPanel(
           numericInput(inputId = "b.20",
                          label = "effect size (b): (opcional)",
                          value = 0,
                          min = -1000, 
                          max = 1000,
                          step = 0.01
             ),
             numericInput(inputId = "ratio.20",
                          label = "Razao da taxa de resposta (exp(b))",
                          value = 1.3,
                          min = 0, 
                          max = 1000,
                          step = 0.01
             ),
             numericInput(inputId = "mutb0baseline.20",
                          label = "a taxa de resposta baseline (exp(b0))",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.05
              ),            
            numericInput(inputId = "mut.20",
                          label = "o tempo medio de exposicao",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.05
              ), 
              numericInput(inputId = "phi.20",
                          label = "parametro de dispersao",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.1
              ),             
              numericInput(inputId = "sig.level.20",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.20",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
           selectInput("Dist.20", "Escolha a variavel explicativa X",
                list("normal","exponencial","uniforme","binomial")
            ),
             numericInput(inputId = "mux.20",
                          label = "Primeiro parametro: N(mu), Exp(lambda),Unif(c) e Bin(p) de X",
                          value = 0,
                          min = -10000,
                          max = 10000,
                          step = 1
             ),
             numericInput(inputId = "sigma2x.20",
                          label = "Segundo parametro: N(sigma^2) e Unif(d) de X",
                          value = 1,
                          min = 0,
                          max = 10000,
                          step = 0.5
             ),
             checkboxInput("two.sided.20", "teste bilateral", TRUE),
             checkboxInput("regsimple.20", "Regressao multipla", FALSE),
             numericInput(inputId = "corpark.20",
                          label = "Correlacao parcial",
                          value = 0.6,
                          min = -1,
                          max = 1,
                          step = 0.01
           ) 
           ),
           mainPanel(
             h3("O Tamanho da Amostra"),
             textOutput("resposta.20")
           )
         ) #Pagesidebar
         ) #Shinyui
         ),  
tabPanel("ANOVA",
         shinyUI(pageWithSidebar(
           headerPanel("Analise de variancia balanceada um fator (ANOVA)"),
           sidebarPanel(
             numericInput(inputId = "f.21",
                          label = "Effect Size",
                          value = 0.28,
                          min = 0.01,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "k.21",
                          label = "Numero de grupos",
                          value = 4,
                          min = 3,
                          max = 100,
                          step = 1
             ),
             numericInput(inputId = "sig.level.21",
                          label = "alfa",
                          value = 0.05,
                          min = 0,
                          max = 1,
                          step = 0.01
             ),
             numericInput(inputId = "power.21",
                          label = "poder",
                          value = 0.8,
                          min = 0,
                          max = 1,
                          step = 0.01
             )
           ),
           mainPanel(
             h3("Tamanho Amostral: "),
             textOutput("resposta.21")
           )
         ) #Pagesidebar
         ) #Shinyui
         ),widths = c(3,9) #tabpanel             
  ), #navlistPanel  
  tags$h6("Se voce usar este WEBSITE, por favor o CITE em seus trabalhos como: 'SANTOS, T. R. e QUININO, R. C. e TAVARES, R. (2019) Easy Sample Size Project (ESSP).Disponivel em: <http://est.ufmg.br/~thiagords/ESSP.htm>. Acesso em: [data do acesso].'", style ="text-align: center;"),  
  tags$h6("Disclaimer: Use of any application from this APP is at own risk!", style ="text-align: center;"),  
  tags$h6("@ Copyright 2019. All Rights Reserved. Term of use.", style ="text-align: center;")
)#FluidPageUI
server <- shinyServer(function(input, output) {
  output$resposta.1 <- renderText({
    z <- qnorm((1 + input$conf.1) / 2)
    if (input$one.sided.1) {
      z <- qnorm(input$conf.1)
    }
    if (input$cc.1) {
      if (input$fpc1) res <- (input$N.1 * (input$d.1 + input$p.1 * (1 - input$p.1) * z ^ 2) + sqrt(input$N.1 * input$p.1 * (1 - input$p.1) * z ^ 2 * (2 * input$N.1 * input$d.1 + input$N.1 * input$p.1 * (1 - input$p.1) * z ^ 2 - 1))) / (2 * ( input$d.1 ^ 2 * input$N.1 + input$p.1 * (1 - input$p.1) * z ^ 2)) else res <- (z ^ 2 * input$p.1 * (1 - input$p.1) + sqrt((input$d.1 + z ^ 2 * input$p.1 * (1 - input$p.1)) ^ 2 + input$d.1 ^ 2) + input$d.1) / (2 * input$d.1 ^ 2)
    }
    else if (input$fpc1) res <- input$p.1 * (1 - input$p.1) * z ^ 2 * input$N.1 / (input$p.1 * (1 - input$p.1) * z ^ 2 + input$d.1 ^ 2 * (input$N.1 - 1))
    else res <- input$p.1 * (1 - input$p.1) * (z / input$d.1) ^ 2
    paste0("Recomenda-se que a amostra tenha ", ceiling(res), " individuos."
    )
  })
  output$resposta.122 <- renderText({
if (input$precision.122 == 0) stop("bad input value for precision")
if (input$precision.122 < 0 | input$precision.122 > 1) stop("input value for precision not between 0 and 1")
if (input$p.122 < 0 | input$p.122 > 1) stop("input value for p not between 0 and 1")
if (input$p2.122 < 0 | input$p2.122 > 1) stop("input value for p not between 0 and 1")
if (input$conf.122 < 0 | input$conf.122 > 1) stop("input value for conf not between 0 and 1")
d <- input$precision.122
z <- qnorm((1 + input$conf.122) / 2)
if (!input$two.sided.122) z <- qnorm(input$conf.122)
if (input$fpc122==TRUE) {
if (input$cc.122) res <- ceiling((input$N.122 * (d + (input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2) + sqrt(input$N.122 *(input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2 * (2 * input$N.122 * d + input$N.122 * (input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2 - 1))) / (2 * ( d ^ 2 * input$N.122 + (input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2)))
else res <- ceiling((input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2 * input$N.122 / ((input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * z ^ 2 + d ^ 2 * (input$N.122 - 1)))
}
if (input$fpc122==FALSE) {
N <- "Infinite"
if (input$cc.122) res <- ceiling((z ^ 2 * (input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) + sqrt((d + z ^ 2* (input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122))) ^ 2 - d ^ 2) + d) / (2 * d ^ 2))
else res <- ceiling((input$p.122 * (1 - input$p.122)+input$p2.122 * (1 - input$p2.122)) * (z / d) ^ 2)
}
paste0("Recomenda-se que a amostra tenha ", 2*(res+1), " individuos (", res+1, " individuos de cada grupo).")
  })
  output$resposta.2 <- renderText({
    if (input$sd.known.2) {z <- qnorm((1 + input$conf.2) / 2)
    if (input$one.sided.2) {z <- qnorm(input$conf.2)}
    if (input$fpc2){res <- ceiling((1/((input$d.2/(z*input$sd.2))^2 + 1/input$N.2)))}else{res <- ceiling((z * input$sd.2 / input$d.2) ^ 2)}
    }else {
      if (input$one.sided.2){if(input$fpc2){
        f <- function(x) (qt(input$conf.2, x - 1) * input$sd.2 / input$d.2) ^ 2 - x
      }else{f <- function(x) (1/((input$d.2/(qt(input$conf.2, x - 1)*input$sd.2))^2 + 1/input$N.2)) - x}}else{if(input$fpc2){
        f <- function(x) (1/((input$d.2/(qt((1 + input$conf.2) / 2, x - 1)*input$sd.2))^2 + 1/input$N.2)) - x
      }else{f <- function(x) ((qt((1 + input$conf.2) / 2, x - 1)) * input$sd.2 / input$d.2) ^ 2 - x}}
      res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
    }
    paste0("Recomenda-se que a amostra tenha ", res, " individuos."
    )
  })
output$resposta.222 <- renderText({
if (input$knownv.222==TRUE){
if (input$precision.222 == 0) stop("bad input value for precision")
if (input$sd1.222 < 0) stop("input value for sd not positive")
if (input$sd2.222 < 0) stop("input value for sd not positive")
if (input$conf.222 < 0 | input$conf.222 > 1) stop("input value for conf not between 0 and 1")
sdd<-sqrt(input$sd1.222^2+input$sd2.222^2)
d <- abs(input$precision.222)
z <- qnorm((1 + input$conf.222) / 2)
if (input$two.sided.222==FALSE) z <- qnorm(input$conf.222)
if (input$fpc222) {
res <- ceiling((input$N.222 * (z * sdd) ^ 2) / ((input$N.222 - 1) * d ^ 2 + (z * sdd) ^ 2))
}else {
N <- "Infinite"
res <- ceiling((z *sdd / d) ^ 2)
}
}
if (input$knownv.222==FALSE){
if (input$equalv.222==FALSE){
d <- abs(input$precision.222)
nn<-min(input$n1.222-1,input$n2.222-1) 
sdd<-sqrt(input$sd1.222^2+input$sd2.222^2)
qqt=qt((1+input$conf.222)/2, nn)
if (input$two.sided.222==FALSE){qqt=qt((1-input$conf.222), nn)}  
if (!is.null(input$N.222)) {fc=sqrt((input$N.222-nn)/(input$N.222-1))
res <- ceiling((1 * (qqt * sdd*fc) ^ 2) / ((1) * d ^ 2 ))}else{res <- ceiling((1 * (qqt*sdd) ^ 2) / ((1) * d ^ 2 ))}
}
if (input$equalv.222==TRUE){
d <- abs(input$precision.222)
nn<-input$n1.222-1+input$n2.222-1
sdd<-sqrt(((input$n1.222-1)*(input$sd1.222^2)+(input$n2.222-1)*(input$sd2.222^2))/(input$n1.222+input$n2.222-2))
qqt=qt((1+input$conf.222)/2, nn)
if (input$two.sided.222==FALSE){qqt=qt((1-input$conf.222), nn)}  
if (!is.null(input$N.222)) {fc=sqrt((input$N.222-nn)/(input$N.222-1))
res <- ceiling((1 * (qqt *sqrt(2)*sdd*fc) ^ 2) / ((1) * d ^ 2 ))}else{res <- ceiling((1 * (qqt *sqrt(2)*sdd) ^ 2) / ((1) * d ^ 2 ))}
}
}
paste0("Recomenda-se que a amostra tenha ", 2*(res+1), " individuos (", res+1, " individuos de cada grupo).")
})  
  output$resposta.333 <- renderText({
    f <- function(x) 1 + (input$width.333 * qchisq((1 + input$conf.333) / 2, x - 1) * qchisq((1 - input$conf.333) / 2, x - 1)) / ((qchisq((1 + input$conf.333) / 2, x - 1) - qchisq((1 - input$conf.333) / 2, x - 1)) * input$variance.333)  - x
    res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
    paste0("Recomenda-se que a amostra tenha ", res," individuos."
    )
  })
  output$resposta.322 <- renderText({
if (input$re.322 <= 0) stop("bad input value for relative error")
if (input$re.322 > 1) stop("bad input value for relative error")
if (input$conf.322 < 0 )stop("input value for conf not between 0 and 1")
if (input$conf.322 > 1) stop("input value for conf not between 0 and 1")   
f <- function(x) -input$conf.322 + (pf((1 + input$re.322), x - 1, x - 1) - pf((1 - input$re.322), x - 1, x - 1)) 
res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
paste0("Recomenda-se que a amostra tenha ", res," individuos.")
})  
  output$resposta.4 <- renderText({
    z.a <- qnorm(1 - input$sig.level.4 / 2)
    if (!input$two.sided.4) {
      z.a <- qnorm(1 - input$sig.level.4)
    }
    z.b <- qnorm(input$power.4)
    res <- ceiling(((z.a * sqrt(input$p0.4 * (1 - input$p0.4)) + z.b * sqrt(input$p1.4 * (1 - input$p1.4))) / (input$p1.4 - input$p0.4)) ^ 2)
    if (input$cc.4) {
      res <- ceiling(res + 1 / (z.a * sqrt(input$p0.4 * (1 - input$p0.4) / res) + z.b * sqrt(input$p1.4 * (1 - input$p1.4) / res)))
    }      
    paste0("Recomenda-se que a amostra tenha ", res, " individuos."
    )
  })
  output$resposta.5 <- renderText({
    z.a <- qnorm(1 - input$sig.level.5 / 2)
    if (!input$two.sided.5) {
      z.a <- qnorm(1 - input$sig.level.5)
    }
    z.b <- qnorm(input$power.5)
    res <- ceiling(((z.a * sqrt((input$p1.5 + input$p2.5) * (1 - input$p1.5 + 1 - input$p2.5) / 2) + z.b * sqrt(input$p1.5 * (1 - input$p1.5) + input$p2.5 * (1 - input$p2.5))) / (input$p1.5 - input$p2.5)) ^ 2)
    if (input$cc.5) {
      res <- ceiling(res / 4 * (1 + sqrt(1 + (4 / (res * abs(input$p1.5 - input$p2.5))))) ^ 2)
    }
    paste0("Recomenda-se que a amostra tenha ", 2 * res," individuos (", res, " individuos de cada grupo)."
    )
  })
  output$resposta.6 <- renderText({
    if (input$sd.known.6) {
      z.a <- qnorm(1 - input$sig.level.6)
      if (input$two.sided.6) {
        z.a <- qnorm(1 - input$sig.level.6 / 2)
      }
      z.b <- qnorm(input$power.6)
      res <- ceiling(((z.a + z.b) * input$sd.6 / input$d.6) ^ 2)
    }
    else {
      if (!input$two.sided.6) f <- function(x) ((qt(1 - input$sig.level.6, x - 1) + qt(input$power.6, x - 1)) * input$sd.6 / input$d.6) ^ 2 - x else f <- function(x) ((qt(1 - input$sig.level.6 / 2, x - 1) + qt(input$power.6, x - 1)) * input$sd.6 / input$d.6) ^ 2 - x
      res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
    }        
    paste0("Recomenda-se que a amostra tenha ", res, " individuos."
    )
  })
  output$resposta.7 <- renderText({
    if (input$sd.known.7) {
      z.a <- qnorm(1 - input$sig.level.7)
      if (input$two.sided.7) {
        z.a <- qnorm(1 - input$sig.level.7 / 2)
      }
      z.b <- qnorm(input$power.7)
      res <- ceiling((z.a + z.b) ^ 2 * (input$sd1.7 ^ 2 + input$sd2.7 ^ 2) / input$d.7 ^ 2)
    }
    else {
      if (!input$two.sided.7) f <- function(x) (qt(1 - input$sig.level.7, x - 1) + qt(input$power.7, x - 1)) ^ 2 * (input$sd1.7 ^ 2 + input$sd2.7 ^ 2) / input$d.7 ^ 2 - x else f <- function(x) (qt(1 - input$sig.level.7 / 2, x - 1) + qt(input$power.7, x - 1)) ^ 2 * (input$sd1.7 ^ 2 + input$sd2.7 ^ 2) / input$d.7 ^ 2 - x
      res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
    }
    paste0("Recomenda-se que a amostra tenha ", 2 * res, " individuos (", res, " individuos de cada grupo)."
    )
  })
  output$resposta.6v <- renderText({
if (input$power.6v < 0 | input$power.6v > 1) stop("input value for conf not between 0 and 1")
if(input$rrc.6v) rr<-input$R.6v
else rr<-input$sigma20.6v/input$sigma21.6v
if (!input$two.sided.6v) {alpha1=2*input$alpha.6v}
else{alpha1=2*input$alpha.6v}
if (input$two.sided.6v) f <- function(x,y) -input$power.6v + (pchisq(((rr)*qchisq(input$alpha.6v/2,x-1)), x - 1)) + (1-pchisq(((rr)*qchisq(1-input$alpha.6v/2,x-1)), x - 1)) 
if (!input$two.sided.6v) f <- function(x,y) -input$power.6v + (pchisq(((rr)*qchisq(input$alpha.6v,x-1)), x - 1)) + (1-pchisq(((rr)*qchisq(1-input$alpha.6v,x-1)), x - 1)) 
res <- ceiling(uniroot(f, c(2,1e+07), c(2,1e+07),tol = .Machine$double.eps ^ 0.25)$root)
paste0("Recomenda-se que a amostra tenha ", res, " individuos.")
  })
output$resposta.7v <- renderText({
if (input$power.7v < 0 | input$power.7v > 1) stop("input value for conf not between 0 and 1")
if(input$rrc.7v) rr<-input$R.7v
else rr<-input$sigma21.7v/input$sigma22.7v
if (!input$two.sided.7v) {alpha1=2*input$alpha.7v}
else{alpha1=input$alpha.7v}
if (input$two.sided.7v) f <- function(x) -input$power.7v + (pf(((rr)*qf(input$alpha.7v/2,x-1, x - 1)), x - 1, x - 1)) + (1-pf(((rr)*qf(1-input$alpha.7v/2,x-1, x - 1)), x - 1, x - 1)) 
if (!input$two.sided.7v) f <- function(x) -input$power.7v + (pf(((rr)*qf(input$alpha.7v,x-1, x - 1)), x - 1, x - 1)) + (1-pf(((rr)*qf(1-input$alpha.7v,x-1, x - 1)), x - 1, x - 1)) 
res <- ceiling(uniroot(f, c(2,1e+07),tol = .Machine$double.eps ^ 0.25)$root)
paste0("Recomenda-se que a amostra tenha ", 2 * res, " individuos (", res, " individuos de cada grupo).")
  })
  output$resposta.8 <- renderText({
    z.a <- qnorm(1 - input$sig.level.8 / 2)
    if (!input$two.sided.8) {
      z.a <- qnorm(1 - input$sig.level.8)
    }
    z.b <- qnorm(input$power.8)
    z.r <- log((1 + input$r.8) / (1 - input$r.8)) / 2
    res <- ceiling(((z.b + z.a) / z.r) ^ 2 + 3)
    paste0("Recomenda-se que a amostra tenha ", res, " pares de observacoes."
    )
  })
  output$resposta.9 <- renderText({
    if(input$two.sided.9){
      if(input$sd.know.9){ z.a <- Mod(qnorm(input$sig.level.9/2)) ; z.b <- Mod(qnorm(input$power.9)) ; res <- ceiling((input$sd1.9^2 + input$sd2.9^2)*((z.a + z.b)/(input$dif.9 - input$e.9))^2)
      }else{f<-function(x){(input$sd1.9^2 + input$sd2.9^2)*((Mod(qt(input$sig.level.9/2,x-1)) + Mod(qt(input$power.9/2,x-1)))/(input$dif.9 - input$e.9))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }else{
      if(input$sd.know.9){ z.a <- Mod(qnorm(input$sig.level.9)) ; z.b <- Mod(qnorm(input$power.9)) ; res <- ceiling((input$sd1.9^2 + input$sd2.9^2)*((z.a + z.b)/(input$dif.9 - input$e.9))^2)
      }else{f<-function(x){(input$sd1.9^2 + input$sd2.9^2)*((Mod(qt(input$sig.level.9,x-1)) + Mod(qt(input$power.9,x-1)))/(input$dif.9 - input$e.9))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }
    paste0("Recomenda-se que a amostra tenha ", res, " pares de observacoes.")
  })
  output$resposta.10 <- renderText({
    if(input$two.sided.10){
      if(input$sd.know.10){ z.a <- Mod(qnorm(input$sig.level.10/2)) ; z.b <- Mod(qnorm(input$power.10/2)) ; res <- ceiling((input$sd1.10^2 + input$sd2.10^2)*((z.a + z.b)/(input$e.10 - input$dif.10))^2)
      }else{f<-function(x){(input$sd1.10^2 + input$sd2.10^2)*((Mod(qt(input$sig.level.10/2,x-1)) + Mod(qt(input$power.10/4,x-1)))/(input$e.10 - input$dif.10))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }else{
      if(input$sd.know.10){ z.a <- Mod(qnorm(input$sig.level.10)) ; z.b <- Mod(qnorm(input$power.10)) ; res <- ceiling((input$sd1.10^2 + input$sd2.10^2)*((z.a + z.b)/(input$e.10 - input$dif.10))^2)
      }else{f<-function(x){(input$sd1.10^2 + input$sd2.10^2)*((Mod(qt(input$sig.level.10,x-1)) + Mod(qt(input$power.10/2,x-1)))/(input$e.10 - input$dif.10))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }
    paste0("Recomenda-se que a amostra tenha ", res, " pares de observacoes.")
  })
  output$resposta.11 <- renderText({
    if(input$two.sided.11){
      if(input$sd.know.11){ z.a <- Mod(qnorm(input$sig.level.11/2)) ; z.b <- Mod(qnorm(input$power.11)) ; res <- ceiling(((input$p1.11*(1-input$p1.11)) + (input$p2.11*(1-input$p2.11)))*((z.a + z.b)/((input$p1.11 - input$p2.11) - input$e.11))^2)
      }else{f<-function(x){((input$p1.11*(1-input$p1.11)) + (input$p2.11*(1-input$p2.11)))*((Mod(qt(input$sig.level.11/2,x-1)) + Mod(qt(input$power.11/2,x-1)))/((input$p1.11 - input$p2.11) - input$e.11))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }else{
      if(input$sd.know.11){ z.a <- Mod(qnorm(input$sig.level.11)) ; z.b <- Mod(qnorm(input$power.11)) ; res <- ceiling(((input$p1.11*(1-input$p1.11)) + (input$p2.11*(1-input$p2.11)))*((z.a + z.b)/((input$p1.11 - input$p2.11) - input$e.11))^2)
      }else{f<-function(x){((input$p1.11*(1-input$p1.11)) + (input$p2.11*(1-input$p2.11)))*((Mod(qt(input$sig.level.11,x-1)) + Mod(qt(input$power.11,x-1)))/((input$p1.11 - input$p2.11) - input$e.11))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }
    paste0("Recomenda-se que a amostra tenha ", res, " pares de observacoes.")
  })
  output$resposta.12 <- renderText({
    if(input$two.sided.12){
      if(input$sd.know.12){ z.a <- Mod(qnorm(input$sig.level.12/2)) ; z.b <- Mod(qnorm(input$power.12/2)) ; res <- ceiling(((input$p1.12*(1-input$p1.12)) + (input$p2.12*(1-input$p2.12)))*((z.a + z.b)/(input$e.12 - Mod(input$p1.12-input$p2.12)))^2)
      }else{f<-function(x){((input$p1.12*(1-input$p1.12)) + (input$p2.12*(1-input$p2.12)))*((Mod(qt(input$sig.level.12/2,x-1)) + Mod(qt(input$power.12/4,x-1)))/(input$e.12 - Mod(input$p1.12-input$p2.12)))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }else{
      if(input$sd.know.12){ z.a <- Mod(qnorm(input$sig.level.12)) ; z.b <- Mod(qnorm(input$power.12)) ; res <- ceiling(((input$p1.12*(1-input$p1.12)) + (input$p2.12*(1-input$p2.12)))*((z.a + z.b)/(input$e.12 - Mod(input$p1.12-input$p2.12)))^2)
      }else{f<-function(x){((input$p1.12*(1-input$p1.12)) + (input$p2.12*(1-input$p2.12)))*((Mod(qt(input$sig.level.12,x-1)) + Mod(qt(input$power.12/2,x-1)))/(input$e.12 - Mod(input$p1.12-input$p2.12)))^2 - x}
      res <- ceiling(uniroot(f, c(2,1e+07))$root)}
    }
    paste0("Recomenda-se que a amostra tenha ", res, " pares de observacoes.")
  })
output$resposta13 <- renderText({
    Varcomb<- (((input$Tamanho1.13-1)*(input$Var1.13))+((input$Tamanho2.13-1)*(input$Var2.13)))/(input$Tamanho1.13+input$Tamanho2.13-2)   
      if (input$two.sided.13){
    Zalfa <- abs(qnorm((input$sig.level.13)/2, mean = 0, sd = 1)) 
    }
    if (input$two.sided.13==FALSE){  Zalfa <- abs(qnorm(input$sig.level.13, mean = 0, sd = 1)) 
    }
    Zpoder <- abs(qnorm(input$power.13, mean = 0, sd = 1)) 
    n <- round((2*pi*Varcomb*((Zalfa+Zpoder)^2))/(3*(input$e.13)^2))  
    N<-2*n
     if(input$Tamanhosiguais==FALSE){
        if(input$Tamanho1.13 > input$Tamanho2.13){
          p<- (input$Tamanho2.13)/(input$Tamanho1.13)
        n1<- round(n)
        n2<- round(n1*p)
        }
        if(input$Tamanho1.13 < input$Tamanho2.13){
            p<- (input$Tamanho1.13)/(input$Tamanho2.13)
        n2<- round(n)
        n1<- round(n2*p)
          }
        if(input$Tamanho1.13 == input$Tamanho2.13){
         p<-0.5
        n1<- round(n)
        n2<- round(n)
            }
           header <- "Sample Size for Wilcoxon's Test"
         paste0("Recomenda-se que a amostra tenha  ", n1, "  Grupo1      ", n2, "     Grupo2")
     }else{
              paste0("Recomenda-se que a amostra tenha  ", n, "  Grupo1      ", n, "     Grupo2")
            }
  })
output$resposta.14 <- renderText({
if(!require("WMWssp")) {install.packages("WMWssp", repos="http://cran.r-project.org"); library("WMWssp")}
if(input$Dist.14=="1/2"){tt=1/2}
if(input$Dist.14=="min"){tt="min"}
fita=WMWssp(x=as.numeric(unlist(strsplit(input$vecshi1.14,","))),y=as.numeric(unlist(strsplit(input$vecshi2.14,","))),alpha=input$sig.level.14,power =input$power.14)
aa=fita[[1]]
n1=aa[[1]][9]
n2=aa[[1]][10]
paste0("\nRecomenda-se que a amostra tenha\n","\t\t", round(n1),"\t\t", "e" , round(n2),"\t\t", " individuos nos Grupos 1 e 2.\n")
}
)
output$resposta.15 <- renderText({
if (input$two.sided.15){
n=1.06*((qnorm(input$power.15)+qnorm(1-input$alpha.15/2))/(0.5*log((1+input$rho.15)/(1-input$rho.15))))^2+3
}else{n=1.06*((qnorm(input$power.15)+qnorm(1-input$alpha.15))/(0.5*log((1+input$rho.15)/(1-input$rho.15))))^2+3
}
nn=ceiling(n)
header <- "Sample Size for Spearman Correlation Test"
cat("\n", header, "\n", "\n")
paste0("Recomenda-se que a amostra tenha ",nn, " individuos.")
})
output$resposta.15b <- renderText({
if (input$two.sided.15b){
n=1.06*((qnorm(input$power.15b)+qnorm(1-input$alpha.15b/2))/(0.5*log((1+input$rho.15b)/(1-input$rho.15b))))^2+3
}else{n=1.06*((qnorm(input$power.15b)+qnorm(1-input$alpha.15b))/(0.5*log((1+input$rho.15b)/(1-input$rho.15b))))^2+3
}
nn=ceiling(n)
header <- "Sample Size for Spearman Correlation Test"
cat("\n", header, "\n", "\n")
paste0("Recomenda-se que a amostra tenha ",nn, " individuos.")
})
output$resposta.16 <- renderText({               
if(!require("pwr")) {install.packages("pwr", repos="http://cran.r-project.org"); library("pwr")}
library(pwr)
header <-"Teste Qui-Quadrado"
li=input$k.16-1
cc=input$c.16-1
if(li==0){li=1}
if(cc==0){cc=1}
fitn=pwr.chisq.test(w=input$f.16,df=(li*cc),power=input$power.16,sig.level=input$sig.level.16)
cat("\n", header, "\n", "\n")
paste0("\nRecomenda-se que a amostra tenha\n","\t\t", ceiling(fitn$N),"\t\t", " individuos.\n","\t\t\t\t","\nNOTA: n e o numero de observacoes.\n"
)
})
output$resposta.17 <- renderText({
if(!require("MultNonParam")) {install.packages("MultNonParam", repos="http://cran.r-project.org"); library("MultNonParam")}
header <-"Teste de Kruskal-Wallis"
fitn=kwsamplesize(shifts=as.numeric(unlist(strsplit(input$vecshi1,","))), distname = input$Distribuicao,targetpower =input$power.17, level =input$sig.level.17, taylor = input$taylor.17)
cat("\n", header, "\n", "\n")
paste0("\nRecomenda-se que a amostra tenha\n","\t\t", ceiling(fitn),"\t\t", " individuos.\n","\t\t\t\t","\nNOTA: n e o numero de observacoes.\n")
})
output$resposta.18 <- renderText({
if(input$regsimple.18){
if(input$varxy.18){
if (abs(input$b.18) > 1) stop("input value for b not between -1 and 1")
if (input$sig.level.18 < 0 | input$power.18 > 1) stop("input value for power not between 0 and 1")
if (input$sig.level.18 < 0 | input$sig.level.18 > 1) stop("input value for sig.level not between 0 and 1")
VIFkk=1/(1-(input$corpark.18^2))
sigma<-sqrt(input$sigma2y.18-(input$sigma2x.18*input$b.18*input$b.18))
lambda <- (((input$b.18-0)^2)*(input$sigma2x.18))/(sigma^2)
if (!input$two.sided.18) f <- function(x) pf(qf(1-input$sig.level.18/2,1,x-2),1,x-2,ncp=x*lambda,lower = FALSE)-input$power.18 else
f <- function(x) pf(qf(1-input$sig.level.18,1,x-2),1,x-2,ncp=x*lambda,lower = FALSE)-input$power.18
res <- ceiling(uniroot(f, c(3,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
res <-ceiling(res*VIFkk)
header <- "Results for Two-Sided Multiple Linear Regression"
cat("\n", header, "\n", "\n")
paste0("Recomenda-se que a amostra tenha ", res, " individuos.")
}else{

if (abs(input$b.18) > 1) stop("input value for b not between -1 and 1")
if (input$power.18 < 0 | input$power.18 > 1) stop("input value for power not between 0 and 1")
if (input$sig.level.18 < 0 | input$sig.level.18 > 1) stop("input value for sig.level not between 0 and 1")
z.r <- sqrt(1-input$b.18*input$b.18)/input$b.18
if (!input$two.sided.18) f <- function(x) ((qt(input$power.18,x-2) + qt(1-input$sig.level.18/2,x-2))*z.r)^2 + 2 - x else 
f <- function(x) ((qt(input$power.18,x-2) + qt(1-input$sig.level.18,x-2))*z.r)^2 + 2 - x
res <- ceiling(uniroot(f, c(3,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
header <- "Results for Two-Sided Simple Linear Regression"
if (!input$two.sided.18) header <- "Results for One-Sided Simple Linear Regression: t-test"
cat("\n", header, "\n", "\n")
VIFkk=1/(1-(input$corpark.18^2))
paste0("Recomenda-se que a amostra tenha ", ceiling(res*VIFkk), " individuos.")
}
}
else{
if(input$varxy.18){
if (abs(input$b.18) > 1) stop("input value for b not between -1 and 1")
if (input$power.18 < 0 | input$power.18 > 1) stop("input value for power not between 0 and 1")
if (input$sig.level.18 < 0 | input$sig.level.18 > 1) stop("input value for sig.level not between 0 and 1")
sigma<-sqrt(input$sigma2y.18-(input$sigma2x.18*input$b.18*input$b.18))
lambda <- (((input$b.18-0)^2)*(input$sigma2x.18))/(sigma^2)
if (!input$two.sided.18) f <- function(x) pf(qf(1-input$sig.level.18/2,1,x-2),1,x-2,ncp=x*lambda,lower = FALSE)-input$power.18 else
f <- function(x) pf(qf(1-input$sig.level.18,1,x-2),1,x-2,ncp=x*lambda,lower = FALSE)-input$power.18
res <- ceiling(uniroot(f, c(3,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
header <- "Results for Two-Sided Simple Linear Regression"
cat("\n", header, "\n", "\n")
paste0("Recomenda-se que a amostra tenha ", res, " individuos.")
}else{
if (abs(input$b.18) > 1) stop("input value for b not between -1 and 1")
if (input$power.18 < 0 | input$power.18 > 1) stop("input value for power not between 0 and 1")
if (input$sig.level.18 < 0 | input$sig.level.18 > 1) stop("input value for sig.level not between 0 and 1")
z.r <- sqrt(1-input$b.18*input$b.18)/input$b.18
if (!input$two.sided.18) f <- function(x) ((qt(input$power.18,x-2) + qt(1-input$sig.level.18/2,x-2))*z.r)^2 + 2 - x else 
f <- function(x) ((qt(input$power.18,x-2) + qt(1-input$sig.level.18,x-2))*z.r)^2 + 2 - x
res <- ceiling(uniroot(f, c(3,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
header <- "Results for Two-Sided Simple Linear Regression"
if (!input$two.sided.18) header <- "Results for One-Sided Simple Linear Regression: t-test"
cat("\n", header, "\n", "\n")
paste0("Recomenda-se que a amostra tenha ", res, " individuos.")
}
}
})
output$resposta.19 <- renderText({
if (input$regsimple.19 == FALSE){
if (input$Dist.19 == "categorica"){
if (input$P0.19 < 0 | input$P0.19 > 1) stop("input value for P0 not between 0 and 1")
if (input$P1.19 < 0 | input$P1.19 > 1) stop("input value for P1 not between 0 and 1")
if (input$Phx.19 < 0 | input$Phx.19 > 1) stop("input value for Prop. X=1 not between 0 and 1")
if (input$power.19 < 0 | input$power.19 > 1) stop("input value for power not between 0 and 1")
if (input$siglev.19 < 0 | input$siglev.19 > 1) stop("input value for sig.level not between 0 and 1")
z.a <- qnorm(1 - input$siglev.19 / 2)
if (!input$two.sided.19) z.a <- qnorm(1 - input$siglev.19)
z.b <- qnorm(input$power.19)
if(input$odds.19==FALSE){pp1<-(input$P1.19/(1-input$P1.19));pp0<-(input$P0.19/(1-input$P0.19));B=log(pp1/pp0)-0;Oddsb1=exp(B); ress=input$P1.19;}
if(input$odds.19){f <- function(x){((input$Oddsb.19*input$P0.19)/(1-input$P0.19))-(x/(1-x))};
res <-(uniroot(f, c(0.00001,0.9999), tol = .Machine$double.eps ^ 0.25)$root);  ress=res;
B<-log(input$Oddsb.19)-0;Oddsb1=input$Oddsb.19;}
pb=(1-input$Phx.19)*input$P0.19+input$Phx.19*ress
res1<- ceiling(((z.a*sqrt(pb*(1-pb)/input$Phx.19) + z.b*sqrt(input$P0.19*(1-input$P0.19)+ress*(1-ress)*((1-input$Phx.19)/input$Phx.19)))^2) / ((1-input$Phx.19)*((input$P0.19-ress)^2)))
header <- "Results for Two-Sided Simple Logistic Regression for X1 Categorical Variable"
if (input$two.sided.19==FALSE) header <- "Results for One-Sided Simple Logistic Regression for X1 Categorical Variable"
cat("\n", header, "\n", "\n")
resfinal<-res1
}
}
if (input$regsimple.19 == FALSE){
if (input$Dist.19 == "continua"){
if (input$P0.19 < 0 | input$P0.19 > 1) stop("input value for P0 not between 0 and 1")
if (input$P1.19 < 0 | input$P1.19 > 1) stop("input value for P1 not between 0 and 1")
if (input$power.19 < 0 | input$power.19 > 1) stop("input value for power not between 0 and 1")
if (input$siglev.19 < 0 | input$siglev.19 > 1) stop("input value for sig.level not between 0 and 1")
z.a <- qnorm(1 - input$siglev.19/2)
if (!input$two.sided.19) z.a <- qnorm(1-input$siglev.19)
z.b <- qnorm(input$power.19)
if(input$odds.19==FALSE){pp1<-(input$P1.19/(1-input$P1.19));pp0<-(input$P0.19/(1-input$P0.19));B=log(pp1/pp0)-0;Oddsb1=exp(B); ress=input$P1.19;}
if(input$odds.19){f <- function(x){((input$Oddsb.19*input$P0.19)/(1-input$P0.19))-(x/(1-x))};
res <-(uniroot(f, c(0.00001,0.9999), tol = .Machine$double.eps ^ 0.25)$root);  ress=res;
B<-log(input$Oddsb.19)- 0;Oddsb1=input$Oddsb.19;}
res1 <- ceiling(((z.a + z.b)^2) / (((input$P0.19)*(1-input$P0.19))*(B^2)))
header <- "Results for Two-Sided Simple Logistic Regression: Continuous Variable"
if (!input$two.sided.19) header <- "Results for One-Sided Simple Logistic Regression: Continuous Variable"
cat("\n", header, "\n", "\n")
resfinal<-res1
}
}
if (input$regsimple.19 == TRUE){
if (input$Dist.19 == "categorica"){
if (input$P0.19 < 0 | input$P0.19 > 1) stop("input value for P0 not between 0 and 1")
if (input$P1.19 < 0 | input$P1.19 > 1) stop("input value for P1 not between 0 and 1")
if (input$Phx.19 < 0 | input$Phx.19 > 1) stop("input value for Prop. X=1 not between 0 and 1")
if (input$corpark.19 < 0 | input$corpark.19 > 1) stop("input value for R2 not between 0 and 1")
if (input$power.19 < 0 | input$power.19 > 1) stop("input value for power not between 0 and 1")
if (input$siglev.19 < 0 | input$siglev.19 > 1) stop("input value for sig.level not between 0 and 1")
z.a <- qnorm(1 - input$siglev.19 / 2)
if (!input$two.sided.19) z.a <- qnorm(1 - input$siglev.19)
z.b <- qnorm(input$power.19)
VIFkk=1/(1-(input$corpark.19^2))
if(input$odds.19==FALSE){pp1<-(input$P1.19/(1-input$P1.19));pp0<-(input$P0.19/(1-input$P0.19));B=log(pp1/pp0)-0;Oddsb1=exp(B); ress=input$P1.19;}
if(input$odds.19){f <- function(x){((input$Oddsb.19*input$P0.19)/(1-input$P0.19))-(x/(1-x))};
res <-(uniroot(f, c(0.00001,0.9999), tol = .Machine$double.eps ^ 0.25)$root);  ress=res;
B<-log(input$Oddsb.19)-0;Oddsb1=input$Oddsb.19;}
pb=(1-input$Phx.19)*input$P0.19+input$Phx.19*ress
res1<- ceiling(((z.a*sqrt(pb*(1-pb)/input$Phx.19) + z.b*sqrt(input$P0.19*(1-input$P0.19)+ress*(1-ress)*((1-input$Phx.19)/input$Phx.19)))^2) / ((1-input$Phx.19)*((input$P0.19-ress)^2)))
header <- "Results for Two-Sided Multiple Logistic Regression for X1 Categorical Variable"
if (!input$two.sided.19) header <- "Results for One-Sided Multiple Logistic Regression for X1 Categorical Variable"
cat("\n", header, "\n", "\n")
resfinal<-ceiling(res1*VIFkk)
}
}
if (input$regsimple.19 == TRUE){
if (input$Dist.19 == "continua"){
if (input$P0.19 < 0 | input$P0.19 > 1) stop("input value for P0 not between 0 and 1")
if (input$P1.19 < 0 | input$P1.19 > 1) stop("input value for P1 not between 0 and 1")
if (input$corpark.19 < 0 | input$corpark.19 > 1) stop("input value for R2 not between 0 and 1")
if (input$power.19 < 0 | input$power.19 > 1) stop("input value for power not between 0 and 1")
if (input$siglev.19 < 0 | input$siglev.19 > 1) stop("input value for sig.level not between 0 and 1")
z.a <- qnorm(1 - input$siglev.19 / 2)
if (!input$two.sided.19) z.a <- qnorm(1 - input$siglev.19)
z.b <- qnorm(input$power.19)
VIFkk=1/(1-(input$corpark.19^2))
if(input$odds.19==FALSE){pp1<-(input$P1.19/(1-input$P1.19));pp0<-(input$P0.19/(1-input$P0.19));B=log(pp1/pp0)-0;Oddsb1=exp(B); ress=input$P1.19;}else{f <- function(x){((input$Oddsb.19*input$P0.19)/(1-input$P0.19))-(x/(1-x))};
res <-(uniroot(f, c(0.00001,0.9999), tol = .Machine$double.eps ^ 0.25)$root);  ress=res;
B<-log(input$Oddsb.19)-0;Oddsb1=input$Oddsb.19;}
res1<- ceiling(((z.a + z.b)^2) / (((input$P0.19)*(1-input$P0.19))*(B^2))) 
header <- "Results for Two-Sided Multiple Logistic Regression: Continuous Variable"
if (input$two.sided.19==FALSE) header <- "Results for One-Sided Multiple Logistic Regression: Continuous Variable"
cat("\n", header, "\n", "\n")
resfinal<-ceiling(res1*VIFkk)
}
}
paste0("Recomenda-se que a amostra tenha ", resfinal, " individuos.")
})
output$resposta.20 <- renderText({
if (input$sig.level.20 < 0 | input$power.20 > 1) stop("input value for power not between 0 and 1")
if (input$sig.level.20 < 0 | input$sig.level.20 > 1) stop("input value for sig.level not between 0 and 1")
VIFkk=1
bes<-log(input$ratio.20)
mutb0baseline.20<-input$mutb0baseline.20
if(input$b.20!=0){bes<-input$b.20}
if(input$regsimple.20){
VIFkk=1/(1-(input$corpark.20^2))
}
z.a <- qnorm(1 - input$sig.level.20 / 2)
if (!input$two.sided.20) {
z.a <- qnorm(1 - input$sig.level.20)
}
z.b <- qnorm(input$power.20)
if(input$Dist.20=="normal"){
b0varx<-input$sigma2x.20^2
b1varx<-(1/(input$sigma2x.20^2))*exp(-bes*input$mux.20+(-0.5*bes*bes*(input$sigma2x.20^2)))
}
if(input$Dist.20=="exponencial"){
b0varx<-input$mux.20^(-2)
b1varx<-(1/input$mux.20)*((input$mux.21-bes)^(3))
}
if(input$Dist.20=="uniforme"){
b0varx<-((input$sigma2x.20-input$mux.20)^2)/12
mm<-(exp(bes*input$sigma2x.20)-exp(bes*input$mux.20))/(((input$sigma2x.20-input$mux.20))*bes)
m1<-((bes*input$sigma2x.20-1)*exp(bes*input$sigma2x.20)-(bes*input$mux.20-1)*exp(bes*input$mux.20))/(((input$sigma2x.20-input$mux.20))*(bes^2))
m11<-((-2*bes*input$sigma2x.20+2+bes*input$sigma2x.20^2)*exp(bes*input$sigma2x.20)-(-2*bes*input$mux.20+2+bes*input$mux.20^2)*exp(bes*input$mux.20))/(((input$sigma2x.20-input$mux.20))*(bes^3))
b1varx<-mm/(mm*m11-m1*m1)
}
if(input$Dist.20=="binomial"){
b0varx<-1*(input$mux.20*(1-input$mux.20))
b1varx<-(1/(1-input$mux.20))+(1/(input$mux.20*exp(bes)))
}
num<-(z.a*sqrt(1/b0varx) + (z.b)*sqrt(b1varx))^2
den<-input$mut.20*mutb0baseline.20*(bes^2)
res <- 1.01*ceiling(input$phi.20*(num/den))    
header <- "Results for Two-Sided Multiple Poisson Regression"
cat("\n", header, "\n", "\n") 
if(input$Dist.20=="binomial"){
if(ceiling(res*VIFkk)>5){ans<-ceiling(res*VIFkk -5)                                           
paste0("Recomenda-se que a amostra tenha ", ans, " individuos.")
}
}else{paste0("Recomenda-se que a amostra tenha ", ceiling(res*VIFkk)-1, " individuos.")}
})
output$resposta.21 <- renderText({
if(!require("pwr")) {install.packages("pwr", repos="http://cran.r-project.org"); library("pwr")}
library(pwr)
header <-"Balanced one-way analysis of variance sample size calculation"
fitn=pwr.anova.test(f=input$f.21,k=input$k.21,power=input$power.21,sig.level=input$sig.level.21)
cat("\n", header, "\n", "\n")
paste0("\nRecomenda-se que a amostra tenha\n","\t\t", ceiling(fitn$n),"\t\t", " individuos.\n","\t\t\t\t","\nNOTA: n e o numero em cada grupo.\n")
})
})
shinyApp(ui, server)
