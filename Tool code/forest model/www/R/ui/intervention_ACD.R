div(class = 'interventions',
    fluidRow(
      column(width = 8,
             materialSwitch(inputId = "rcdsc_switch", label = 'Active Case Detection', value = FALSE,
                            status = "info", right = TRUE, inline = FALSE, width = NULL)
      ),
      column(width = 4,
             conditionalPanel(condition = "input.rcdsc_switch",
                              dropdownButton(label = "Settings", circle = FALSE, status = "primary", size = 'sm', icon = icon("gear"), 
                                             width = "700px", tooltip = FALSE, right = TRUE,
                                             fluidRow(
                                               column(4,
                                                      awesomeCheckbox(inputId="rcdpf_switch", label = "P. falciparum ACD only", value = FALSE),
                                                      sliderInputReg(inputId="yr_rcdscstart", label = "Year to start", value = 2019, min=2010, max=2030, step=1, sep=NULL),
                                                      sliderInputReg(inputId="clustRCDcoex2", label = "Added value of ACD targetting", value = 50, min=0, max=100, step=10, post = " %"),
                                                      sliderInputReg(inputId="ss2", label = "No. of people to be tested", value = 20, min=0, max=1000, step=10, post = " person(s)")
                                               ),
                                               column(4,
                                         #             sliderInputReg(inputId="mvis", label = "Maximum number of visits per month", value = 2, min=1, max=20,step=1, post = " visit(s)"),
                                                      sliderInputReg(inputId="acdsc_cov1", label = "Percentage of cases responded to", value = 80, min=0, max=100,step=1, post = " %"),
                                                      sliderInputReg(inputId="cpacdvisit1", label = "Cost per visit per case investigated", value = c(75, 125), min=0, max=1000,step=5, post = " US$")
                                               )
                                                                                     )
                              )
             )
      )
    ),
    tags$small("Active case detection with house to house fever screening every week")
)