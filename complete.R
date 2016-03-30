
## Test Me:
#
## complete("specdata", 1)
##   id nobs
## 1  1  117
## complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
## complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
## complete("specdata", 3)
##   id nobs
## 1  3  243

complete <- function(directory, id = 1:332) {
    cases <- rep(0, length(id))
    # Based in the directory, get all the files (exact path/names)
    files <- paste(directory, as.character(list.files(directory)), sep="/")
    x <- 1
    # Iterate over the files using the ID
    for(i in id) {
        data <- read.csv(files[i])
        cases[x] <- sum(complete.cases(data))
        x <- x + 1
    }
    # Return a data frame with the id and cc.
    data.frame(id=id, nobs = cases)
}