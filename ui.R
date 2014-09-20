shinyUI(pageWithSidebar (
  headerPanel("Permeability Predictor"),
  sidebarPanel(
    sliderInput('id1', 'log P (octanol-water partition coefficient)', 2, min=-2, max=6, step=0.1),
    sliderInput('id4', 'Total Polar Surface Area (TPSA) of Molecule', 60, min=0, max=120, step=2),
    numericInput('id2', 'pKa of molecule', 7, min=0, max=20, step=0.1),
    numericInput('id3', 'pH of solution', 7, min=2, max=12, step=0.1),
    p(em("Documentation:",a("Permability Predictor",href="index.html")))
    ),
  mainPanel(
##    h3('Model Output'),
##    h4('For a molecule with a TPSA of'), verbatimTextOutput("oid4"),
##    h4('a log P of'), verbatimTextOutput("oid1"),
##    h4('and a pKa of'), verbatimTextOutput("oid2"),
##    h4('in a solution at pH'), verbatimTextOutput("oid3"),
    h4('The predicted log (apparent Permeability) is'), verbatimTextOutput("pAppPred"),
    plotOutput('fancyPlot')
    )
  ))