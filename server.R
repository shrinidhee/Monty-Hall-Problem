shinyServer(function(input, output, session) {
  
  choice <- reactiveVal(0)
  
  callModule(door2, "door_1", choice)
  callModule(door2, "door_2", choice)
  
  output$test <- renderPrint({
    choice()
  })
  
})