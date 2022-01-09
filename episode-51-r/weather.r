#!/usr/bin/env Rscript

suppressPackageStartupMessages(require(httr))

# JSON looks like this:
# {
#   "temperature": "+8 °C",
#   "wind": "17 km/h",
#   "description": "Partly cloudy",
#   "forecast": [
#     {
#       "day": "1",
#       "temperature": "+7 °C",
#       "wind": "17 km/h"
#     },
#     {
#       "day": "2",
#       "temperature": "+7 °C",
#       "wind": "9 km/h"
#     },
#     {
#       "day": "3",
#       "temperature": "+8 °C",
#       "wind": "9 km/h"
#     }
#   ]
# }

url = "https://goweather.herokuapp.com/weather/London"
data = content(GET(url))

for (day in data$forecast) {
  cat("Forecast for", day$day, "is", day$temperature, "\n")
}
