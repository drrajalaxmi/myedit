startPCBrowser <-
function(){
  if (interactive()) {
    #the upload file size limit is 30MB
    options( shiny.maxRequestSize = 30 * 1024 ^ 2, warn = -1,
             shiny.sanitize.errors = TRUE)
    addResourcePath(prefix = "demo", directoryPath =
                      system.file("extdata", "demo",
                                  package = "debrowser"))
    addResourcePath(prefix = "www", directoryPath =
                      system.file("extdata", "www",
                                  package = "debrowser"))
    environment(deServer) <- environment()

    app <- shinyApp( ui = shinyUI(deUI),
                     server = shinyServer(deServer))
    runApp(app)
  }
}
