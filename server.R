library(shiny)
library(ggplot2)

default_retention <- data.frame( Day = as.integer(c(0)), Retention_Rate = c(100) , Memo = as.factor("default"))

shinyServer(
        function(input, output) {
                
                retention <- reactive({
                        
                        
                        input_retention <- data.frame(Day = as.integer(c(1,3,7,14,30)) , 
                                                      Retention_Rate = c(input$rr1, input$rr3,input$rr7, input$rr14, input$rr30), 
                                                      Memo = as.factor("input"))
                        
                        m <- lm(log(Retention_Rate) ~ log(Day), data = input_retention)
                        b <- exp(m$coef[1])
                        a <- m$coef[2]
                        
                        prediction_retention <- data.frame(Day = as.integer(c(60,90,120,150,180)), 
                                                           Retention_Rate = c(b*60^a, b*90^a, b*120^a, b*150^a, b*180^a), 
                                                           Memo = as.factor("prediction"))
                        
                        retention <- rbind(default_retention,input_retention, prediction_retention)   
                        
                })
                
                
                
                output$result <- renderTable({
                        retention() 
                })
                
                output$plot <- renderPlot({
                        
                        temp <- retention() 
                        qplot(Day, Retention_Rate, data = temp, colour = Memo)
                })
                
})