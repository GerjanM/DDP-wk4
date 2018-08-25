# Define UI for application that shows a table of sport activities
shinyUI(fluidPage(
  # Application title
  titlePanel("Gerjan's Sport activities"),
  # Sidebar with checkboxes to choose an activity 
  sidebarPanel(uiOutput("SelectActivity"),
    # Show a table of the choosen activities
    mainPanel(
      textOutput("text1"),
      #show a plot of the activity
      plotOutput("ActPlot",width = "300%"),
      tableOutput("data")
    )
  )
))
