shinyServer(function(input, output, session) {
  
  prize_door <- reactiveVal(sample(3, 1))
  choice_number <- reactiveVal(0)
  door_choice <- reactiveValues(first = NULL, second = NULL)
  score <- reactiveValues(won = 0, lost = 0)
  
  open_door <- reactive({
    req(door_choice$first)
    setdiff(1:3, c(prize_door(), door_choice$first)) %>% 
      as.character() %>% 
      sample(1) %>% 
      as.numeric()
  })
  
  callModule(door, "door_1", choice_number = choice_number, door_id = 1, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door, open_door = open_door)
  callModule(door, "door_2", choice_number = choice_number, door_id = 2, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door, open_door = open_door)
  callModule(door, "door_3", choice_number = choice_number, door_id = 3, 
             door_choice = door_choice, new_game = reactive(input$new_game),
             prize_door = prize_door, open_door = open_door)
  
  observeEvent(door_choice$second, {
    if(door_choice$second == prize_door()) {
      score$won <- score$won + 1
    } else {
      score$lost <- score$lost + 1
    }
  })
  
  observeEvent(input$new_game, {
    choice_number(0)
    door_choice$first <- NULL
    door_choice$second <- NULL
    prize_door(sample(3, 1))
  })
  
  observeEvent(input$reset_score, {
    score$won <- 0
    score$lost <- 0
  })
  
  output$test <- renderPrint({
    c("first" = door_choice$first, "Sec" = door_choice$second, "pd" = prize_door(),
      "ndoors" = as.numeric(input$ndoors))
  })
  
  output$test2 <- renderPrint({
    c("won" = score$won, "lost" = score$lost)
  })
  
  output$never_switch <- renderValueBox({
    valueBox("33%", "Expected Win %: Never Switch Strategy", color = "red")
  })
  
  output$always_switch <- renderValueBox({
    valueBox("67%", "Expected Win %: Always Switch Strategy", color = "green")
  })
  
  output$games_played <- renderValueBox({
    req((score$won + score$lost) > 0)
    valueBox(sum(score$won, score$lost), "Games Played", color = "blue")
  })
  
  output$actual_score <- renderValueBox({
    req((score$won + score$lost) > 0)
    current_score <- round(score$won * 100 / (score$won + score$lost), 1)
    valueBox(paste0(current_score, "%"), "Player Win %", color = "blue")
  })
  
})