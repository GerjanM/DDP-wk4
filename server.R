library(shiny)
library(ggplot2)
# reading in files
df <- read.csv("Activities.csv")
##subsetting the data:
df1<-df[,c(1,2,5,7,8,9,13,15)] 
# 
shinyServer(function(input, output) {
#select activity output
  output$SelectActivity<-renderUI({
    radioButtons("act-type", "Activities to show:",selected=c("running"),
                       levels(df1$Activiteittype)[c(1,2,7)])
     })
#show a plot of the choosen activity
  output$ActPlot<-renderPlot({
    df2<-df1[df[,1]==input$`act-type`,,drop=TRUE]
    df2$Gem..HS<-as.numeric(levels(df2$Gem..HS))[df2$Gem..HS]
    df2$Datum<-strptime(df2$Datum, '%Y-%m-%d %H:%M:%S')
    df2$Datum<-julian(df2$Datum)
    plot(df2$Datum,df2$Gem..HS,title("Average heartrate trend for selected activity"),
         ylim=c(50,200),xlim = c(17000,17800),
         xlab="Time (Julian)",ylab = "Average HeartRate")
  #add a regression line
    abline(lm(df2$Gem..HS~df2$Datum),col="blue",lwd=2)
    })
#show a table of the choosen activities
  output$data <- renderTable({
    df2<-df1[df[,1]==input$`act-type`,,drop=TRUE]
    df2
   }, rownames = FALSE)
})
 