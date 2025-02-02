library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
library(ggplot2)

shinyUI(dashboardPage(
  dashboardHeader(title = "Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      div(
        class = "user-profile",
        tags$img(src = "https://danviet.mediacdn.vn/upload/2-2019/images/2019-04-02/Vi-sao-Kha-Banh-tro-thanh-hien-tuong-dinh-dam-tren-mang-xa-hoi-khabanh-1554192528-width660height597.jpg", width = "50px", height = "50px"),
        div(
          style = "display: inline-block; vertical-align: top; margin-top: 5px; margin-left: 10px;",
          p("Yuhh", style = "text-align: center; font-size: 15px; margin: 0;"),
          div(
            style = "text-align: center; margin-top: -1px; margin-right: 20px;",
            icon("circle", class = "text-success", style = "font-size: 15px"),
            " Online"
          )
        )
      ),
      menuItem("Weather Today", tabName = "weather", icon = icon("cloud")),
      menuItem("Weather Forecast", tabName = "forecast", icon = icon("line-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "weather",
              div(class = 'tab-content',
                  tabPanel("Weather",
                           class = "active",
                           h1(style ="font-size:66px;", "Current Weather",
                              tags$img(src = "https://coalregioncanary.com/wp-content/uploads/2020/08/summer.gif", width = "150px", height = "100px")
                           ),
                           splitLayout(
                             cellWidths = c("50%", "50%"),
                             div(class = "content",
                                 fluidRow(
                                   column(
                                     width = 12,
                                     h2(
                                        span(icon("location-crosshairs", lib = "font-awesome", style = "font-size: 55px; margin-right: 5px;"),textOutput("city1"), style = "font-size: 55px; font-weight: bold;  display: flex;", id = "location")
                                     )
                                   )
                                 ),
                                 fluidRow(
                                   column(
                                     width = 12,
                                     h3(
                                       span(textOutput("datetime"), style = "font-size: 25px; font-weight: bold;", id = "Time")
                                     )
                                   )
                                 ),
                                 fluidRow(
                                   column(
                                     width = 12,
                                     h2(
                                       icon("temperature-three-quarters", lib = "font-awesome", style = "font-size: 35px; margin-right: 5px;"),
                                       span("Current Temperature: ", style = "font-size: 35px;"),
                                     )
                                   )
                                 ),
                                 fluidRow(
                                   column(
                                     width = 12,
                                     h3( style = "font-size: 35px;",textOutput("temperature")),
                                   )
                                 ),
                                 fluidRow(
                                   column(width = 12, div(class = "line-split"))
                                 ),
                                 fluidRow(column(width = 12)),
                                 fluidRow(
                                   box(
                                     width = 4,
                                     title = div(
                                       style = "display: flex; align-items: center;",
                                       tags$img(src = "https://cdn4.iconfinder.com/data/icons/coronavirus-30/48/13-256.png", width = "30px", height = "30px"),
                                       "Feels Like"
                                     ),
                                     status = "danger",
                                     solidHeader = TRUE,
                                     span(textOutput("feels_like"), id = "feels_like")
                                   ),
                                   box(
                                     width = 4,
                                     title = div(
                                       style = "display: flex; align-items: center;",
                                       tags$img(src = "https://cdn3.iconfinder.com/data/icons/weather-972/48/humadity-256.png", width = "30px", height = "30px"),
                                       "Humidity"
                                     ),
                                     status = "info",
                                     solidHeader = TRUE,
                                     span(textOutput("humidity"), id = "humidity")
                                   ),


                                   box(
                                     width = 4,
                                     title = div(
                                       style = "display: flex; align-items: center;",
                                       tags$img(src = "https://cdn3.iconfinder.com/data/icons/miscellaneous-248-line/128/atmosphere_environment_condition_weather_climate_cloudy_global_ecology_nature-256.png", width = "30px", height = "30px"),
                                       "Condition"
                                     ),
                                     status = "success",
                                     solidHeader = TRUE,
                                     span(textOutput("weather_condition"), id = "weather_condition")
                                   ),

                                   box(
                                     width = 4,
                                     title = div(
                                       style = "display: flex; align-items: center;",
                                       tags$img(src = "https://cdn3.iconfinder.com/data/icons/basic-element-line/3873/404_-_Eye-64.png", width = "30px", height = "30px"),
                                       "Visibility"
                                     ),
                                     status = "warning",
                                     solidHeader = TRUE,
                                     span(textOutput("visibility"), id = "visibility")
                                   ),

                                   box(width = 4,
                                       
                                       title = div(
                                         style = "display: flex; align-items: center;",
                                         tags$img(src = "https://cdn3.iconfinder.com/data/icons/weather-free-2/32/Weather_Free_Outline_weather-wind-breeze-256.png", width = "30px", height = "30px"),
                                         "Wind Speed"
                                       ),
                                       status = "primary",
                                       solidHeader = TRUE,
                                       span(textOutput("wind_speed"), id = "wind_speed")
                                   ),

                                   box(width = 4,
                                       title = div(
                                         style = "display: flex; align-items: center;",
                                         tags$img(src = "https://cdn1.iconfinder.com/data/icons/weather-vol-01-1/32/barometer-gauge-measure-pressure-air-device-meteorology-256.png", width = "30px", height = "30px"),
                                         "Air Pressure"
                                       ),
                                       status = "info",
                                       solidHeader = TRUE,
                                       span(textOutput("pressure"), id = "pressure")
                                   )

                                 )
                             ),
                             div(class = "content",
                                 fluidRow(

                                   box(
                                     title = "Map",
                                     width = "10",
                                     height = "480px",
                                     leafletOutput("map", height = "400px")
                                   )
                                 )

                             )
                           ),
                  )
              ),
      ),
      tabItem(tabName = "forecast",
              fluidRow(
                div(class = 'tab-content', style = "margin-left: 35px;",
                  h1("Location:", style = "margin-right: 10px;"),
                  h1(textOutput("city2"), style = "margin-left: 0;"),
                  
                  div(class='form-group shiny-input-container',
                        selectizeInput(
                          label = "Features:",
                          inputId = "feature",
                          choices = c("temp", "feels_like", "temp_min", "temp_max", "pressure",
                                      "sea_level", "grnd_level", "humidity", "speed", "deg", "gust"),
                          selected = "temp",
                          options = list(
                            plugins = list('selectize-plugin-a11y')
                          )

                      ),
                    ),
                  div(class='col-sm-6',
                    plotlyOutput("weatherPlot")
                  ),
                  tags$img(src = "https://media.licdn.com/dms/image/D4D12AQEqcDffeVfu1w/article-cover_image-shrink_600_2000/0/1696334961739?e=2147483647&v=beta&t=bNSn6-ByCW6PI6tt0oVmtkg3Axg-EbTfsG-fU1JpX7A", width = "500px", height = "400px"),
                )

              )
      )
    )
  )
  )
)
