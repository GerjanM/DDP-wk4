
 

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gerjan's activities"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    checkboxGroupInput("act-type", "Activities to show:",
                       levels(df1$Activiteittype)[c(1,2,3,4,7)]),
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("text1"),
      tableOutput("data")
    )
  )
))
