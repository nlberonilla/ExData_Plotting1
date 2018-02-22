download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./quiz/electric.zip")
unzip("./quiz/electric.zip", exdir = "quiz")

electric <- read.table("./quiz/household_power_consumption.txt",
                    sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric <- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
electric$datetime <- strptime(paste(electric$Date, electric$Time),
                              "%d/%m/%Y %H:%M:%S")

png("./quiz/ExData_Plotting1/plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
#plot1 (row1,col1)
with(electric, plot(datetime, Global_active_power, type="l",
                    xlab="", ylab="Global Active Power"))
#plot2 (row1,col2)
with(electric, plot(datetime, Voltage, type="l"))

#plot3 (row2, col1)
with(electric, plot(datetime, Sub_metering_1, type="l",
                    xlab="", ylab="Energy sub metering"))
with(electric, lines(datetime, Sub_metering_2, type="l",
                     col="red"))
with(electric, lines(datetime, Sub_metering_3, type="l",
                     col="blue"))
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1,
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"))
#plot4 (row2, col2)
with(electric, plot(datetime, Global_reactive_power, type="l"))

dev.off()
