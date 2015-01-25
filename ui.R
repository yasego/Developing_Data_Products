library(shiny)


shinyUI(pageWithSidebar(
        headerPanel("Retention Prediction"),
        sidebarPanel(
                
                helpText("Note : Please be sure to input proper numbers.", 
                         span("In general,Retention decrease as Day'N' increased",style = "color:blue")),br(),
                
                
                numericInput(inputId="rr1", label = "Input Day1 Retention(%)", 
                             valu=, 50, min = 1, max = 100),
                
                numericInput(inputId="rr3", label = "Input Day3 Retention(%)", 
                             valu=, 30, min = 1, max = 100),
                
                numericInput(inputId="rr7", label = "Input Day7 Retention(%)", 
                             valu=, 20, min = 1, max = 100),
                
                numericInput(inputId="rr14", label = "Input Day14 Retention(%)", 
                             valu=, 10, min = 1, max = 100),
                
                numericInput(inputId="rr30", label = "Input Day30 Retention(%)", 
                             valu=, 5, min = 1, max = 100),
                
                submitButton('Submit')
                
        ),
        mainPanel(
                
                
                tabsetPanel(type = "tabs", 
                            tabPanel("Retention Prediction", tableOutput("result")), 
                            tabPanel("Plot", plotOutput("plot")))
        )    
        
))
