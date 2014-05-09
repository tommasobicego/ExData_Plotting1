plot1 <- function(){
  data <- readData()
  x <- as.numeric(data[,"Global_active_power"])
  png(file="plot1.png",width=480,height=480)
  hist(x, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
  #dev.copy(device=png, file="plot1.png", width)
  dev.off()
}

readData <- function(){
  data <- read.csv(file="C:/Users/CSP/Desktop/coursera/expl_data_an/ass1/CourseProject1/exdata/household_power_consumption.TXT"
                   #, header = TRUE
                   , sep=";"
                   , skip = 66636
                   , nrows = 2880
                   #, colClasses=c("date","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
                   , colClasses=c("character","character","character","character","character","character","character","character","character"))
  names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
  data$Global_active_power <- lapply(data$Global_active_power,as.numeric)
  data$Global_reactive_power <- lapply(data$Global_reactive_power,as.numeric)
  data$Voltage <- lapply(data$Voltage,as.numeric)
  data$Global_intensity <- lapply(data$Global_intensity,as.numeric)
  data$Sub_metering_1 <- lapply(data$Sub_metering_1,as.numeric)
  data$Sub_metering_2 <- lapply(data$Sub_metering_2,as.numeric)
  data$Sub_metering_3 <- lapply(data$Sub_metering_3,as.numeric)
  data
}