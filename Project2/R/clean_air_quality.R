# Clean one year of daily air quality measurements.
# file_path: path to a CSV with the original EPA concentration and unit columns.
# ozone_units: output units for O3, either "ppm" (default) or "ppb".
# Returns a data frame with one row per date, CO, PM25, O3, and their units.
clean_air_quality <- function(file_path, ozone_units = "ppm") {
  ozone_units <- match.arg(ozone_units, c("ppm", "ppb"))
  air <- read.csv(file_path, check.names = FALSE, na.strings = c("NA", ""))
  names(air) <- c("date", "CO", "units_CO", "PM25", "units_PM25", "O3", "units_O3")
  air$date <- as.Date(air$date, format = "%m/%d/%Y")

  # Remove identical records before they can receive extra weight in the mean.
  air <- unique(air)
  pollutants <- c("CO", "PM25", "O3")
  for (pollutant in pollutants) {
    air[[pollutant]][!is.na(air[[pollutant]]) & air[[pollutant]] < 0] <- 0
  }

  # Average each pollutant separately, keeping all-missing days as NA.
  dates <- sort(unique(air$date))
  daily <- data.frame(date = dates)
  for (pollutant in pollutants) {
    daily[[pollutant]] <- vapply(dates, function(day) {
      values <- air[[pollutant]][air$date == day]
      if (all(is.na(values))) NA_real_ else mean(values, na.rm = TRUE)
    }, numeric(1))
  }

  # Include dates absent from the input without inventing concentrations.
  calendar <- data.frame(date = seq(min(dates), max(dates), by = "day"))
  daily <- merge(calendar, daily, by = "date", all.x = TRUE, sort = TRUE)
  if (ozone_units == "ppb") daily$O3 <- daily$O3 * 1000
  daily$units_CO <- "ppm"
  daily$units_PM25 <- "ug/m3 LC"
  daily$units_O3 <- ozone_units
  daily
}
