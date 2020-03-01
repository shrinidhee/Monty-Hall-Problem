library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(dplyr)
library(shinyjs)

doorUI <- function(id) {
  ns <- NS(id)
  list(
    img(src = "door.png", height ="100%", width = "100%", id = ns("img_door")),
    hidden(img(src = "donkey.jpg", height = "100%", width = "100%", id = ns("img_donkey"))),
    hidden(img(src = "prize.png", height = "100%", width ="100%", id = ns("img_prize"))),
    actionButton(ns("choice_1"), "Choice 1"),
    br(), br(),
    disabled(actionButton(ns("choice_2"), "Choice 2"))
  )
}

door <- function(input, output, session, choice_number, door_id, 
                 door_choice, new_game, prize_door, open_door) {
  
  observeEvent(input$choice_1, {
    choice_number(1)
    door_choice$first <- door_id
  })
  
  observeEvent(input$choice_2, {
    choice_number(2)
    door_choice$second <- door_id
  })
  
  observe({
    if(choice_number() == 1) disable("choice_1")
    if(choice_number() == 1) enable("choice_2")
    if(choice_number() == 2) disable("choice_2")
    if(door_id %in% open_door()) {
      hide("img_door")
      show("img_donkey")
    }
  })
  
  observeEvent(new_game(), {
    enable("choice_1")
    disable("choice_2")
    choice_number(0)
    door_choice$first <- NULL
    door_choice$second <- NULL
    prize_door(sample(3, 1))
    hide("img_donkey")
    show("img_door")
  })
}
