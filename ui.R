dashboardPage(
  dashboardHeader(title = "Monty Hall Problem"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    useShinyjs(),
    tags$head(tags$style(HTML("div.box-header {
                                  text-align: center;
                                }"))),
    fluidRow(
      column(3,
        box(includeHTML("www/info.txt"),
          title = "Game Desc", width = "100%"
        )
      ),
      column(9,
        fluidRow(
          column(1, align = "left",
                 actionButton("reset_score", "Reset Score", width = "100%"),
                 br(), br(),
                 actionButton("new_game", "New Game", width = "100%"),
          ),          
          valueBoxOutput("never_switch", width = 3),
          valueBoxOutput("always_switch", width = 3),
          valueBoxOutput("games_played", width = 2),
          valueBoxOutput("actual_score", width = 3)
        ),
        fluidRow(
          doorUI("door_1", width = 4, title = "Door 1"),
          doorUI("door_2", width = 4, title = "Door 2"),
          doorUI("door_3", width = 4, title = "Door 3")
        )
      )
    )
  )
)