library(shiny)
library(string2dna)

ui <- fluidPage(
  titlePanel("string2dna"),
  markdown("Enter a string to encode to a nucleotide sequence. Alternatively, enter a nucleotide sequence (multiple of three) to decode into plain text. See [stephenturner.github.io/string2dna/](https://stephenturner.github.io/string2dna/) for details."),
  sidebarLayout(
    sidebarPanel(
      textInput(
        inputId = "x",
        label = "Text to encode or sequence to decode",
        value = "",
        placeholder = "Stephen Turner"
      ),
      radioButtons(
        inputId = "method",
        label = "Encode or decode?",
        choices = list("Encode" = "encode", "Decode" = "decode"),
        width = "50%"
      ),
    ),
    mainPanel(
      h4("Output:"),
      textOutput(outputId = "textOutput")
    )
  )
)

server <- function(input, output) {
  output$textOutput <- renderText(string2dna(input$x, method=input$method))
}

shinyApp(ui, server)

