# Model Monitoring Dashboard

library(shiny)
ui <- fluidPage(
  # Title of app
  titlePanel("Model Monitoring Dashboard"),
  
  # Sidebar layout with dates and histogram
  sidebarLayout(
    
    # Control inputs
    sidebarPanel(
      
      # Select variable of interest
      selectInput('var_interest', 'Choose a variable:',
                  choices = c("pd1y_log", "edf5Y_ratio", "pd1Y_ttc",
                              "vol1Y_edf1Y_sector", "vol1Y_pd1y_sector",
                              "diff1Y_pd1y_sp0", "max_edf_pd_sp1", "predict"),
                  # TODO: multiple = TRUE,
                  selected = "pd1y_log"),
      
      # Input dates
      dateInput('date',
                label = 'Date input: yyyy-mm-dd',
                value = Sys.Date())
      
    ),
    
    # Main panel for displaying output
    mainPanel(
      # plotOutput(outputId = "hists")
    )
  )
)

server <- function(input, output) {
  # output$hists  <- renderPlot({
  #   library(dplyr)
  #   dat <- importData(data)
  #   dat <- dat %>% filter(date = input$date) %>% select(input$var_interest)
  #   train <- importData(training)
  #   
  #   library(ggplot2)
  #   ggplot(dat, aes(input$var_interest)) + 
  #     geom_histogram(data = dat, fill = "red", alpha = 0.2) + 
  #     geom_histogram(data = train, fill = "blue", alpha = 0.2)
  #   
  # })
}

runApp(shinyApp(ui = ui, server = server))