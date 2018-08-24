library(shiny)
## reading in files
setwd("D:/Users/Gerjan/R/DDP/DDP_wk4/Sport_activities_Gerjan_Maas")
df <- read.csv("Activities.csv")
##subsetting the data:
#df1<-df[,c(1,2,5,7,8,9,13,15)] 


# 

shinyServer(function(input, output) {
  output$text1=renderText(input$`act-type`)
  #df2<-df1[df[,1]==input$`act-type`,]
  #fitmodel<-lm(df2$)
  df1 <- reactive({  df[,c(1,2,5,7,8,9,13,15)]  })
  #df2 <- reactive({  
#    df1[df[,1]==input$`act-type`,]  })
  output$data <- renderTable({
    df1[df[,1]==input$`act-type`,,drop=TRUE]
   }, rownames = FALSE)
})
    