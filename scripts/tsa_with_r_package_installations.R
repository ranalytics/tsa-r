# Скрипт для автоматической инсталляции пакетов, необходимых для
# воспроизведения примеров из книги "Анализ временных рядов с помощью R"
# (https://ranalytics.github.io/tsa-with-r/)

required_packages <- c("anomalize",
                       "bsts",
                       "corrplot",
                       "devtools",
                       "doParallel",
                       "dtwclust",
                       "dtw",
                       "feasts",
                       "forecast",
                       "ggrepel",
                       "gridExtra",
                       "imputeTS",
                       "proxy",
                       "tidyverse",
                       "tsibble")

existing_packages <- installed.packages()[,"Package"]

to_install <- required_packages[!required_packages %in% existing_packages]

if (length(to_install) > 0) {install.packages(required_packages)}

if (!"BreakoutDetection" %in% existing_packages) {
  devtools::install_github("twitter/BreakoutDetection")}

if (.Platform$OS.type == "windows") {
  install.packages("prophet")
} else {
  install.packages("prophet", type = "source")
}
