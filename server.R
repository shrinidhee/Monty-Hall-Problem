shinyServer(function(input, output, session) {
  
  prize_door <- reactiveVal(sample(3, 1))
  choice <- reactiveVal(0)
  door_choice <- reactiveValues(first = NULL, second = NULL)
  score <- reactiveValues(won = 0, lost = 0)
  
  # output$doors <- renderUI({
  #   lapply(seq_len(as.numeric(input$ndoors)), function(x) {
  #     doorUI(paste0("door_", x))
  #   })
  # })
  
  callModule(door, "door_1", choice = choice, door_id = 1, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door)
  callModule(door, "door_2", choice = choice, door_id = 2, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door)
  callModule(door, "door_3", choice = choice, door_id = 3, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door)
  
  output$test <- renderPrint({
    c("first" = door_choice$first, "Sec" = door_choice$second, "pd" = prize_door(),
      "ndoors" = as.numeric(input$ndoors))
  })
  
  output$never_switch <- renderValueBox({
    valueBox("33%", "Expected Win %: Never Switch Strategy", color = "red")
  })
  
  output$always_switch <- renderValueBox({
    valueBox("67%", "Expected Win %: Always Switch Strategy", color = "green")
  })
  
  output$actual_score <- renderValueBox({
    valueBox("33%", "Player Win %", color = "blue")
  })
  
})