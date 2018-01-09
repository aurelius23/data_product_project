library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Sepal Width from Sepal Length"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("SliderSLength", "What is the Sepal Length of the flower?",4,8, value = 6, step = 0.1),
      checkboxInput("showModel", "Show/Hide Model", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted Sepal Width from Model"),
      textOutput("pred")
  )
)))