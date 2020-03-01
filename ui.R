dashboardPage(
  dashboardHeader(title = "Monty Hall Problem"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    useShinyjs(),
    fluidRow(
      box("some text", title = "Game Desc", width = 4, height = "100px"),
      box(
        radioGroupButtons("ndoors", label= NULL, choiceNames = c("3 Doors", "10 Doors"),
                          choiceValues = c(3, 10)),
        title = "Select number of doors",
        width = 2, align = "center", height = "100px"
      ),
      valueBoxOutput("never_switch", width = 2),
      valueBoxOutput("always_switch", width = 2),
      valueBoxOutput("actual_score", width = 2)
    ),
    hr(),
    actionButton("reset_score", "Reset Score"),
    actionButton("new_game", "New Game"),
    br(), br(),
    box(doorUI("door_1"), width = 4),
    box(doorUI("door_2"), width = 4),
    box(doorUI("door_3"), width = 4),
    br(),
    verbatimTextOutput("test")
  )
)