shinyServer(function(input, output, session) {
  
  choice <- reactiveVal(0)
  door_choice <- reactiveValues(first = NULL, second = NULL)
  
  callModule(door, "door_1", choice = choice, door_id = 1, door_choice = door_choice)
  callModule(door, "door_2", choice = choice, door_id = 2, door_choice = door_choice)
  
  output$test <- renderPrint({
    c(door_choice$first, door_choice$second)
  })
  
})