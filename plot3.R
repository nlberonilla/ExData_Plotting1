download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./quiz/electric.zip")
unzip("./quiz/electric.zip", exdir = "quiz")

electric <- read.table("./quiz/household_power_consumption.txt",
                    sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric <- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
electric$datetime <- strptime(paste(electric$Date, electric$Time),
                              "%d/%m/%Y %H:%M:%S")
png("./quiz/ExData_Plotting1/plot3.png", width = 480, height = 480)
with(electric, plot(datetime, Sub_metering_1, type="l",
                    xlab="", ylab="Energy sub metering"))
with(electric, lines(datetime, Sub_metering_2, type="l",
                     col="red"))
with(electric, lines(datetime, Sub_metering_3, type="l",
                     col="blue"))
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1,
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"))
dev.off()
