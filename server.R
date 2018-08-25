library(shiny)
library(ggplot2)
## reading in files
setwd("D:/Users/Gerjan/R/DDP/DDP_wk4/Sport_activities_Gerjan_Maas")
df <- read.csv("Activities.csv")
##subsetting the data:
df1<-df[,c(1,2,5,7,8,9,13,15)] 
df2<-df1
df2$ID <- NA


# 
shinyServer(function(input, output) {
  #output aelects activity
  output$SelectActivity<-renderUI({
    checkboxGroupInput("act-type", "Activities to show:",
                       levels(df1$Activiteittype)[c(1,2,4,7)])
     })
  #output shows the activity
  output$text1=renderText(input$`act-type`)
  #output shows a plot of the choosen activity
  output$ActPlot<-renderPlot({
    df2<-df1[df[,1]==input$`act-type`,,drop=TRUE]
    #df2<-df2[rowSums(is.na(df2))<length(df2),]
    #####Avg_HeartRate<-as.numeric(levels(df2$Gem..HS))[df2$Gem..HS]
    #####Datum<-strptime(df2$Datum, '%Y-%m-%d %H:%M:%S')
    df2$Gem..HS<-as.numeric(levels(df2$Gem..HS))[df2$Gem..HS]
    df2$ID <- seq.int(nrow(df2))
    
    #df2$Datum<-strptime(df2$Datum, '%Y-%m-%d %H:%M:%S')
    #df2<-df2[complete.cases(df2),]
    plot(df2$ID,df2$Gem..HS)})
  #model and show line
   ####model<-lm(df2$Gem..HS~df2$Datum)
   ####model
   {abline(model,col="red",lwd=2)}
  #output shows a table of the choosen activities
  output$data <- renderTable({
    df2<-df1[df[,1]==input$`act-type`,,drop=TRUE]
    df2
   }, rownames = FALSE)

})
 