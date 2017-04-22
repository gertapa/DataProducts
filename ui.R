shinyUI(pageWithSidebar(
    headerPanel("Simulation of the Variance distribution of dice rolls!"),
    sidebarPanel(
        # define the number of simulations
        sliderInput('simulations', 'Number Of Simulations',
                    value = 5000, min = 1000, max = 10000, step = 1),
        # define the number of dies used for the simulation
        sliderInput('dice', 'Number Of Dice',
                    value = 10, min = 2, max = 20, step = 1)
    ),
    mainPanel(
        h2("Documentation"),
        p("With this application it is possible to simulate the variance of 
          a number of dice rolls. It is expected that the distribution of the 
          sample variance is gaussian with a center at 2.92"),
        p("The mean of the sample variances is calculated and printed below the 
          histogram. The black line in the histogram represents this value."),
        h3("Usage:"),
        p("Use the sliders on the right to change the parameters for 
          the simulation."),
        p("The first slider can be used to define the number of 
          simulations, the second slider defines the number of dice used."),
        plotOutput('dist'),
        h4("Mean Sample Variance"),
        textOutput('var')
    )
))