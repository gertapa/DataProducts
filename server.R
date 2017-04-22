library(ggplot2)

shinyServer(
    function(input, output) {
        
        # render a histogram for the simulated die rolls
        output$dist <- renderPlot({
            ggplot(dat(), aes(x = variance)) + 
                 geom_histogram(alpha = .20, binwidth=.3, colour = "black") +
                 geom_vline(xintercept = mean(dat()$variance), size = 2)
        })
        
        # calculate the mean variance from the simulted data
        output$var <- renderText({
            mean(dat()$variance)
        })
        
        # reactively create simulated data using the input values as parameters
        dat <- reactive({
            # read values from input
            simulations <- input$simulations
            diceCount   <- input$dice
            
            # simulate dice rolls
            data.frame(
                variance = c(apply(matrix(sample(1 : 6, simulations * diceCount, replace = TRUE), 
                                   simulations), 1, var)))
        })
    }
)