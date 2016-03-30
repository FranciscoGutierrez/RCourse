
## Test Me:
#
# pollutantmean("specdata", "sulfate", 1:10)  -> 4.064
# pollutantmean("specdata", "nitrate", 70:72) -> 1.706
# pollutantmean("specdata", "nitrate", 23)    -> 1.281
#

pollutantmean <- function(directory, pollutant, id=1:332) {
    result <- c()
    # Based in the directory, get all the files (exact path/names)
    files <- paste(directory, as.character(list.files(directory)), sep="/")
    # Iterate and concatenate to Result using the ID
    for(i in id) {
        data <- read.csv(files[i])
        # filter columns by pollutant, avoid NA.
        clean <- data[!is.na(data[, pollutant]), pollutant]
        # Push to vector
        result <- c(result, clean)
    }
    # return the mean, not rounded.
    # mean(result)
    round(mean(result),3)
}
