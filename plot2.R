## Plotting Graph 2

## Reading complete dataset
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
req_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)


## Converting dates
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(req_data$Global_active_power~ req_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()