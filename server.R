library(shiny)

shinyServer(function(input,output) {
  model <- lm(Sepal.Width ~ Sepal.Length, data = iris)
  
  modelpred <- reactive({
    SLengthInput <- input$SliderSLength
    predict(model, newdata = data.frame(Sepal.Length = SLengthInput))
  })
  
  output$plot <- renderPlot({
    SLengthInput <- input$SliderSLength
    
    plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, pch=19)
    
    if(input$showModel){
      abline(model, col = "purple", lwd=2)
    }
    points(SLengthInput, modelpred(), col = "purple", pch=19)
      
  })
  
  output$pred <- renderText({
    modelpred()
  })
})









