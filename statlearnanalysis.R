## Analyze data for leabra statistical learning
library(ggplot2)

data <- read.table("TrialOutputData.txt", header=TRUE)

ggplot(test, aes(X.trial,X.sse, colour = X.trial_name)) + geom_point() + stat_smooth(se = FALSE)

data$group = "Same Word" # sets default group 
data$group[data$X.trial_name %in% levels(data$X.trial_name)[c(3:6, 9:12,  15:18, 21:24)]] = "New Word" # create a label for new words

ggplot(data, aes(X.trial, X.sse, colour = group)) + geom_point() + stat_smooth() + ggtitle("Error in expectations for next phoneme in same word vs new word") + xlab("Phoneme") + ylab("Sum of Squared Error (SSE)")

png(filename="StatLearn.png", width = 600, height = 480)

ggplot(data, aes(X.trial, X.sse, colour = group)) + geom_point() + stat_smooth() + ggtitle("Error in expectations for next phoneme in same word vs new word") + xlab("Phoneme") + ylab("Sum of Squared Error (SSE)")

dev.off()