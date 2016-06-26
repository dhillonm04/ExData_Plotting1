household_power_consumption <- "~/datasciencecoursera/course4 - Assignment1/household_power_consumption.txt"
data <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
mydates <- c("2007-02-01","2007-02-02")
mydates <- as.Date(mydates)
subset_data <- data[data$Date %in% mydates ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()