#setwd("./Coursera/Practical_Machine_Learning/Project")
exercise.submission <- read.csv("./data/pml-testing.csv", na.strings=c("NA", "", "#DIV/0!"))

# clean up data
exercise.test.1 <- select(exercise.test, -classe)
exercise.submission <- exercise.submission[, colnames(exercise.test.1)]
# get prediction
pred.submission <- predict(rf1, exercise.submission)

# create submission files
pml_write_files = function(x){
    n = length(x)
    for(i in 1:n){
        filename = paste0("problem_id_",i,".txt")
        write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
    }
}

setwd("./submission")
pml_write_files(pred.submission)