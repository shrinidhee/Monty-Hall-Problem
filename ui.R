dashboardPage(
  dashboardHeader(title = "Monty Hall Problem"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    useShinyjs(),
    fluidRow(
      column(3,
        box("some text", title = "Game Desc")
      ),
      column(9,
        fluidRow(
          box(
           radioGroupButtons("ndoors", label= NULL, choiceNames = c("3 Doors", "10 Doors"),
                             choiceValues = c(3, 10)),
           title = "Select number of doors",
           width = 2, align = "center", height = "100px"
          ),
          valueBoxOutput("never_switch", width = 3),
          valueBoxOutput("always_switch", width = 3),
          valueBoxOutput("actual_score", width = 3),
          column(1, align = "left",
            actionButton("reset_score", "Reset Score", width = "100%"),
            br(), br(),
            actionButton("new_game", "New Game", width = "100%"),
          )
        ),
        fluidRow(
          box(doorUI("door_1"), width = 4, title = "Door 1"),
          box(doorUI("door_2"), width = 4, title = "Door 2"),
          box(doorUI("door_3"), width = 4, title = "Door 3")
        )
      )
    )
  )
)