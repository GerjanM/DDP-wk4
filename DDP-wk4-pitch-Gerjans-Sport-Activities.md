DDP-wk4-pitch-Shiny App Gerjans-Sport-Activities
========================================================
author: G. Maas
date: 26-08-2018
autosize: true

Overview
========================================================

- This pitch presentation is part of the "Developing Data Products" class of Data Science Specilization.

- This App lets you select an overview/table of specific sporting activities I did in the past, shows them in a plot, and gives a trendline of the raise/drop of my average heartrate.

- Data used in the app comes from my Garmin sports watch, exported from Garmin Connect.
This data has the following (usefull) variables:


```
[1] "Activiteittype"  "Datum"           "Afstand"         "Tijd"           
[5] "Gem..HS"         "Max..HS"         "Gemiddeld.tempo" "Stijging"       
```


- In a future release of the App an upload feature could be added, by which a user could use his/her own data.



How to run and use the App?
========================================================

Link to Shiny App: <https://gmaas.shinyapps.io/Sporting-Activities/.>

How to run app:

- Visit app from link above
- check the radiobutton for the activity you want to see

An example of the scatterplot (r code in the app)
========================================================


  


```r
#Making the plot
plot(df$Datum,df$AvgHeartrate,title("Average heartrate trend for selected activity"),
         ylim=c(50,200),xlim = c(17000,17800),
         xlab="Time (Julian)",ylab = "Average HeartRate")
#adding a regression line
    abline(lm(df$AvgHeartrate~df$Datum),col="blue",lwd=2)
```
An example of the scatterplot (as shown by the app)
========================================================

![plot of chunk unnamed-chunk-4](DDP-wk4-pitch-Gerjans-Sport-Activities-figure/unnamed-chunk-4-1.png)
