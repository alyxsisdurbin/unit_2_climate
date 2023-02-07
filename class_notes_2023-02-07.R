# Haley Durbin
# class notes
# 2023 - 02 - 07



# recreating the mean function
x = c(1,2,3)

avg = function(x){
  s = sum(x)
  n = length(x)
  return(s/n)
}
avg(c(1,3,5))

## doing some more stuff to the same function
## allow user to switch between arithmetic and geometric means
avg = function(x, arithmetic=TRUE){
  if(!is.numeric(x)){ #if x is **not!*** numeric, do this...
    stop("x must be numeric")} # creates an error message/ check
  n = length(x)
  result = ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
  return(result)
}

dat = c(1,3,5,7)
avg(dat)
mean(dat)
avg(dat, arithmetic=FALSE)  


########## Exersice 7.1 #########

letter_grade = function(grade){
  if(grade>=90){
    return("You got an A!") }
  else if(grade>=80){
    return("You got a B!") }
  else(grade>=70){
    return("You got a C!") }
}




############# Global Temperature ######################
#######################################################

temp_anomaly = read.table("data/global_temp_data_1880-2022.txt", 
                          skip=5, 
                          sep="", 
                          header = FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))
url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'

url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))


head(temp_anomaly)

temp1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year==1998]
temp2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year==2012]

plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") +
  lines(Lowess_5 ~ Year, data=temp_anomaly, col="red", lwd=2) +
  abline(v =1998, lty = "dashed") +
  abline(v =2012, lty = "dashed") +
    lines(c(temp1998, temp2012))


calc_rolling_avg = function(data, moving_window=5){
  result = rep(NA, length(data))
  for(i in seq(from=moving_window, to=length(data))){
    result[i] = mean(data[seq(from=(i-moving_window+1), to=i)])
  }
}
  
