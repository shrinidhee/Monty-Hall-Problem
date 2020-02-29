shinyServer(function(input, output, session) {
  
  choice <- reactiveVal(0)
  
  callModule(door, "door_1", choice)
  callModule(door, "door_2", choice)
  
  output$test <- renderPrint({
    choice()
  })
  
})