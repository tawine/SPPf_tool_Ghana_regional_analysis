div(class = 'interventions',
    fluidRow(
      column(width = 8,
             materialSwitch(inputId = "rcdMS_switch", label = 'Active Screening', value = FALSE,
                            status = "info", right = TRUE, inline = FALSE, width = NULL)
      ),
      column(width = 4,
             conditionalPanel(condition = "input.rcdMS_switch",
                              dropdownButton(label = "Settings", circle = FALSE, status = "primary", size = 'sm', icon = icon("gear"), width = "500px", tooltip = FALSE,
                                             fluidRow(
                                               column(6,
                                                      checkboxInput(inputId="rcdMSpf_switch", label = "trigger P. falciparum only", value = FALSE),
                                                      sliderInputReg(inputId="costMS2", label = "cost per person screened", value = c(10.50, 17.50), min=0, max=20,step=0.01, post = ' US$')
                                               ),
                                               column(6,
                                                      sliderInputReg(inputId="yr_rcdMSstart", label = "year to start AMS ", value = 2019, min=2018, max=2030, step=1, sep=NULL),
                                      #                sliderInput(inputId="mvis2", label = "maximum number of visits per month", value = 2, min=1, max=20,step=1),
                                                      sliderInputReg(inputId="pcdsc_cov1", label = "coverage of population", value = 80, min=0, max=100,step=1)
                                               )
                                             )
                              )
             )
      )
    ),
    tags$small('Proactive Case Detection through population screening')
)