library(shiny)
library(datasets)
Car_dataset <- datasets::mtcars

fluidPage(     
  titlePanel("Motor trend car road tests"), 
  sidebarLayout(       
    sidebarPanel(p(strong("Source:",style="color:red"), a("mtcars",href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")), 
                 selectInput("Param", "Parameter:",
                             choices=colnames(Car_dataset))
    ), 
    mainPanel( 
      plotOutput("car")   
    ) 
  ) 
) 