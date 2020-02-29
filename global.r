library(shiny)
library(dplyr)

doorUI <- function(id, label) {
  ns <- NS(id)
  list(
    actionButton(ns("choice_1"), "Choice 1"),
    br(), br(),
    conditionalPanel("input.choice_1 == 1", ns = ns,
      actionButton(ns("choice_2"), "Choice 2")
    ),
    br(), br(),
    verbatimTextOutput(ns("button"))
  )
}

door <- function(input, output, session) {
  
  choice <- reactiveVal()
  
  observeEvent(input$choice_1, {
    choice(1)
  })
  
  observeEvent(input$choice_2, {
    choice(2)
  })
  
  output$button <- renderPrint({
    choice()
  })
}