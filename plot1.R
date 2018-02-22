download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./quiz/electric.zip")
unzip("./quiz/electric.zip", exdir = "quiz")

electric <- read.table("./quiz/household_power_consumption.txt",
                    sep = ";", header = TRUE, stringsAsFactors = FALSE)
electric <- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
hist(as.numeric(electric$Global_active_power), col ="red", main = 
       "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "./quiz/ExploratoryDataProject1/plot1.png",
         width = 480, height = 480)
dev.off()
