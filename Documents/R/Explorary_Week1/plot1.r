##Get full dataset
fulldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
##Get the necessary data
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)
##Convert dates 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Create Plot1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Save to a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()