plot3 <- function(){
  library(datasets)
  data <- readData()
  data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
  data[,"Date"] <- as.character(data[,"Date"])
  data[,"Time"] <- as.character(data[,"Time"])
  xx <- paste(data[,"Date"],data[,"Time"])
  wdays <- strptime(xx, format="%Y-%m-%d %H:%M:%S")
  #class(wdays)
  
  png(file="plot3.png",width=480,height=480)
  plot(wdays, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(wdays,data$Sub_metering_2,col="red")
  lines(wdays,data$Sub_metering_3,col="blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}

readData <- function(){
  data <- read.csv(file="household_power_consumption.TXT"
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
