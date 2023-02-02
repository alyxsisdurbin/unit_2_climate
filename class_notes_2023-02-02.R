 # Haley Durbin

library("lubridate")

# 2023 - 02 - 02


#practice while loops

x = 1
while(x>0){
  x = x+1
}

x = 5
while(x>0){
  x = x-1
  print(x)
}
x

#fishing game
total_catch_lb = 0  # track the weight of fish I've caught
n_fish = 0   # track the number of fish I've caught
while (total_catch_lb < 50){
  n_fish = n_fish+1  # I caught another fish!
  new_fish_weight = rnorm(n=1, mean=2, sd=1) # randomly generate the weight of a fish
  total_catch_lb = total_catch_lb + new_fish_weight # calculate weight of all fish caught so far
}
n_fish #how many fish I have caught

total_catch_lb

#########################################################
## Arctic Sea Ice

# arctic_ice = read.csv("data/N_seaice_extent_daily_v3.0.csv", skip=2, header = FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, skip=2, sep=",", header=FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))

head(arctic_ice)

#downloading a package to help us plot dates that are not put in decimal date "lubridate"

arctic_ice$date = make_date(year=arctic_ice$Year, month=arctic_ice$Month, day=arctic_ice$Day)

head(arctic_ice)

plot(Extent~date, data=arctic_ice, type="l", ylab="Arctic sea ice extent (x10^6 km^2)")

#creating an annual average

#need to create a data frame to hold the averages we make with the for loop

arctic_ice_averages = data.frame(Year=seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1),
                                 extent_annual_avg = NA,
                                 extent_5yr_avg = NA)

# mean(arctic_ice$Extent[arctic_ice$Year == 1979])#


for(i in seq(dim(arctic_ice_averages)[1])){
    arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year== arctic_ice_averages$Year[i]])
  
}
head(arctic_ice_averages)

plot(extent_annual_avg ~ Year, data=arctic_ice_averages, col="red", type="l") 

#5 -year average

for (i in seq(from=3, dim(arctic_ice_averages)[1]-2)) # skip the first 2 and last 2 years
{
  years = c(from=arctic_ice_averages$Year[i]-2, to=arctic_ice_averages$Year[i]+2)
  arctic_ice_averages$extent_5yr_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
}
head(arctic_ice_averages)

arctic_ice_averages$date = make_date(year=arctic_ice_averages$Year, month=7, day=1)

# pdf('figures/arctic_ice_extent.pdf', width=7, height=5)
plot(Extent~date, data=arctic_ice, type="l", ylab="Arctic sea ice extent (x10^6 km^2)")
  lines(extent_annual_avg ~ Year, data=arctic_ice_averages, col="red", type="l") +
  lines(extent_5yr_avg ~ Year, data=arctic_ice_averages, col="blue", type="l")
