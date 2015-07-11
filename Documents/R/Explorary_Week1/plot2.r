##Get full dataset
fulldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
##Get the necessary data
data <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)
##Convert dates 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##Create Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()