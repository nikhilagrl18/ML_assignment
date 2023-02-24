

# load all data

# Download dataSet to /Tidydata directory
if(!file.exists("./household_power")){dir.create("./household_power")}
#Here are the data for the project:
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./household_power/Dataset.zip")

# Unzip dataSet to /Tidydata directory
unzip(zipfile="./household_power/Dataset.zip",exdir="./household_power")

# Reading data into R
files = file('./household_power/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value = TRUE), sep = ';', col.names = c("Date","Time","Active_power","Reactive_power","Voltage", "Intensity","submeter_1","submeter_2","submeter_3"),na.strings='?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))


# Plot 1
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot1.png', width = 480, height = 480, units='px')
# plot figure
with (data, hist (Active_power, xlab= 'Active Power (kilowatt)', main = 'Active Power', col = 'red'))
dev.off()

# Plot 2
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width= 480, height = 480, units='px')
# plot figure
#Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Active_power, xlab = '', ylab = 'Active Power (kilowatt)', type = 'l')
dev.off()

# Plot 3
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot3.png', width = 480, height = 480, units='px')
# plot figure
#Sys.setlocale(category="LC_ALL", locale = "english")
plot(data$DateTime, data$submeter_1, xlab= '', ylab = 'Energy sub metering', type = 'l')
lines (data$DateTime, data$submeter_2, col = 'red')
lines (data$DateTime, data$submeter_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('submeter_1', 'submeter_2','submeter_3'),lwd =1)
dev.off()

# Plot 4
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot4.png', width= 480, height = 480, units='px')
# plot figure
#Sys.setlocale(category="LC_ALL", locale = "english")
par(mfrow= c(2, 2))
plot(data$DateTime, data$Active_power, xlab= '', ylab= 'Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, xlab= 'datetime', ylab = 'Voltage', type = 'l')
plot(data$DateTime, data$submeter_1, xlab= '', ylab = 'Energy sub metering', type = 'l')
lines (data$DateTime, data$submeter_2, col = 'red')
lines (data$DateTime, data$submeter_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('submeter_1', 'submeter_2', 'submeter_3'),lwd=1)
plot(data$DateTime, data$Reactive_power, xlab= 'datetime', ylab = 'Reactive Power (kVAR)', type = 'l')
dev.off()

