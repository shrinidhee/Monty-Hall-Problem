library(shiny)
library(dplyr)
library(shinyjs)

doorUI <- function(id) {
  ns <- NS(id)
  list(
    actionButton(ns("choice_1"), "Choice 1"),
    br(), br(),
    disabled(actionButton(ns("choice_2"), "Choice 2"))
  )
}

door <- function(input, output, session, choice, door_id, door_choice, new_game, prize_door) {
  
  observeEvent(input$choice_1, {
    choice(1)
    door_choice$first <- door_id
  })
  
  observeEvent(input$choice_2, {
    choice(2)
    door_choice$second <- door_id
  })
  
  observe({
    if(choice() == 1) disable("choice_1")
    if(choice() == 1) enable("choice_2")
    if(choice() == 2) disable("choice_2")
  })
  
  observeEvent(new_game(), {
    enable("choice_1")
    disable("choice_2")
    choice(0)
    door_choice$first <- NULL
    door_choice$second <- NULL
    prize_door(sample(3, 1))
  })
}
