shinyServer(function(input, output, session) {
  
  prize_door <- reactiveVal(sample(3, 1))
  choice <- reactiveVal(0)
  door_choice <- reactiveValues(first = NULL, second = NULL)
  score <- reactiveValues(won = 0, lost = 0)
  
  callModule(door, "door_1", choice = choice, door_id = 1, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door)
  callModule(door, "door_2", choice = choice, door_id = 2, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door)
  
  output$test <- renderPrint({
    c("first" = door_choice$first, "Sec" = door_choice$second, "pd" = prize_door())
  })
  
})