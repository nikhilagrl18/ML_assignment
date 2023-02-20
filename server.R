ls

library(shiny)
library(datasets)
Car_dataset <- datasets::mtcars

function(input, output) { 
  
  series <- rownames(Car_dataset)
  Title <- c("Miles/(US) gallon",
             "Number of cylinders",
             "Displacement (cu.in.)",
             "Gross horsepower",
             "Rear axle ratio",
             "Weight (1000 lbs)",
             "1/4 mile time",
             "Engine (0 = V-shaped, 1 = straight)",
             "Transmission (0 = automatic, 1 = manual)",
             "Number of forward gears",
             "Number of carburetors"
  )
  
  
  output$car <- renderPlot({ 
    par(mar=c(10, 4.1, 4.1, 2.1))
    barplot(Car_dataset[,input$Param],
            names.arg = c(series),
            las=3,
            cex.axis=1, 
            cex.names=1,
            main=Title[grep(input$Param, colnames(Car_dataset))],
            ylab=input$Param)
  })
}