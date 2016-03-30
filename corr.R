## cr <- corr("specdata", 150)
## head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589

## summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

## cr <- corr("specdata", 400)
## head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783

## summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

## cr <- corr("specdata", 5000)
## summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 

## length(cr)
## [1] 0

## cr <- corr("specdata")
## summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000

## length(cr)
## [1] 323

corr <- function(directory, threshold=0) {
    # get a list of all the files.
    files  <- paste(directory, as.character(list.files(directory)), sep="/")
    # get the complete cases, using previous function.
    cases  <- complete("specdata", 1:332)
    # get a list of the IDs that pass the threshold
    list   <- cases$id[cases$nobs > threshold]
    # create a vector for the results based in the length.
    result <- rep(0, length(list))
    j <- 1
    for(i in list) {
        file <- read.csv(files[i])
        # find the correlation and push to the output.
        result[j] <- cor(file$sulfate, file$nitrate, use="complete.obs")
        j <- j + 1
    }
    result
}



