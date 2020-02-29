shinyUI(
  fluidPage(
    useShinyjs(),
    actionButton("new_game", "New Game"),
    br(), br(),
    doorUI("door_1"),
    br(),br(),
    doorUI("door_2"),
    br(),br(),
    verbatimTextOutput("test")
  )
)