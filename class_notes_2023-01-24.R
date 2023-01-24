# Haley Durbin
# 2023-01-24
# Ice mass loss over poll

read.table(file="data/antarctica_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
           col.names=c("decimal_date", "mass_Gt", "sigma_Gt")) #good way to pull data from a txt file

ant_ice_loss = read.table(file="data/antarctica_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
           col.names=c("decimal_date", "mass_Gt", "sigma_Gt"))

typeof(ant_ice_loss)
class(ant_ice_loss)
dim(ant_ice_loss)

View(ant_ice_loss)

read.table(file="data/greenland_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
           col.names=c("decimal_date", "mass_Gt", "sigma_Gt")) #good way to pull data from a txt file

grn_ice_loss = read.table(file="data/greenland_mass_200204_202209.txt", skip=31, sep="", header=FALSE, 
                          col.names=c("decimal_date", "mass_Gt", "sigma_Gt"))

View(grn_ice_loss)

head(grn_ice_loss)
tail(grn_ice_loss)
summary(grn_ice_loss) #good way to make sure your data looks okay/ no crazy outliers



#plot the data

plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt, type="l", xlab="Year", ylab="Antarctic Ice Loss (Gt)")

# to create a line plot is "l"
# changed the x label to year with xlab=  , can change the y lable to antarctic ice loss w/ ylab=""

#differnt way to plot both iceland and greenland

min(grn_ice_loss$mass_Gt)
#or
range(grn_ice_loss$mass_Gt)
plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt, type="l", xlab="Year", ylab="Antarctic Ice Loss (Gt)", ylim=range(grn_ice_loss$mass_Gt))

lines(mass_Gt~decimal_date, data=grn_ice_loss, col="red")  # ~ means "as a function of"
#col = color


# Add data break betweeen Grace missions

data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)

#insert data break into ice loss data fram=es
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)

dim(ant_ice_loss)
dim(ant_ice_loss_with_NA)      
tail(ant_ice_loss_with_NA) #have to check code --> need to reorder the data 


order(ant_ice_loss_with_NA$decimal_date)
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date), ]
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date), ]


range(grn_ice_loss$mass_Gt)
plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt, type="l", xlab="Year", ylab="Antarctic Ice Loss (Gt)", ylim=range(grn_ice_loss$mass_Gt))
lines(mass_Gt~decimal_date, data=grn_ice_loss_with_NA, col="red")  


# Error Bars!!!

pdf('figures/ice_mass_trends.pdf', width="7", height="5")

plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss_with_NA$mass_Gt, type="l", xlab="Year", ylab="Antarctic Ice Loss (Gt)", ylim=range(grn_ice_loss$mass_Gt))
lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA)
lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA)

dev.off()

#bar plot of total ice losa

tot_ice_loss_ant = min(ant_ice_loss_with_NA$mass_Gt, na.rm=T) - max(ant_ice_loss_with_NA$mass_Gt, na.rm=T)
tot_ice_loss_grn = min(grn_ice_loss_with_NA$mass_Gt, na.rm=T) - max(grn_ice_loss_with_NA$mass_Gt, na.rm=T)

barplot(height=c(tot_ice_loss_ant, tot_ice_loss_grn))


max(ant_ice_loss_with_NA$mass_Gt, na.rm=T)
