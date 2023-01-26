# HAD 2023-01-26
# logical, boolean, if/else

vec = c(1,0,2,1)
vec
vec[c(T,F,T,F)] #R reads in trues and falses

# practice logical operators

1>2
1 > c(0, 1, 2)
c(1, 2, 3) == c(3, 2, 1)
## [1] FALSE  TRUE FALSE

### %in% tests whether the value(s) on the left side are in the vector on the right side.
1 %in% c(3, 4, 5)
## [1] FALSE
c(1, 2) %in% c(3, 4, 5)
## [1] FALSE FALSE
c(1, 2, 3) %in% c(3, 4, 5)
## [1] FALSE FALSE  TRUE
c(1, 2, 3, 4) %in% c(3, 4, 5)
## [1] FALSE FALSE  TRUE  TRUE


world_oceans = data.frame(oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"), 
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
world_oceans
world_oceans$avg_depth_m > 4000 #test condition
deep_oceans = world_oceans$ocean[world_oceans$avg_depth_m > 4000]
deep_oceans

sum(world_oceans$avg_depth_m > 4000) # counts oceans with depth > 4000
## [1] 2


#imprecise numerics
1+2 == 3
0.1 + 0.2 == 0.3 #FALSE but obviously is true, error in the system
0.3 - (-0.1+0.2)
my_error = 0.0001
(0.3- (0.1+0.2)) > my_error #not sure what this is about lol


# Boolean operators

x = 5
x
x > 3 & x < 15 # AND
x < 3 | x > 15 # OR
x < 10 & x %in% c(1,2,3)
x < 10 & x | c(1,2,3)

# subset

world_oceans[world_oceans$avg_depth_m>4000 & world_oceans$area_km2 <50e6, ]
### ^^^above allows us to search for specific data within our dataset that satisifies the conditons we want

z = c(T,F,F)
z
any(z) 
all(z)

# handling missing data "NA"
NA == NA
is.na(NA)
vec = c(0,1,2,NA,4)
is.na(vec)
any(is.na(vec))

#####################################################

# starting if/else statements

######################################################

num = -2

if(num < 0){
  print("oh no, num is negative!")
  num = num*-1
  print("don't worry, i made it positive")
}

num


#excersize 3.1

friend_temp = 103

if(friend_temp > 98.6){ 
  diff_from_norm = (friend_temp - 98.6)
  print(diff_from_norm)
  print("YOU HAVE A FEVER")
  if(friend_temp > 101){
    print("WARNING: YOU HAVE A HIGH FEVER")
  }
}

##################################################
# if/else statement
##################################################

grade = 83

if(grade > 60){
  print("You passed!")
}else{
  print("You failed...")
}
## [1] "You passed!"


## did player 1 win or did player b win or did they tie? 

a = 50
b = 45
if (a > b) {
  print("A wins!")
} else if (a < b) {
  print("B wins!")
} else {
  print("Tie.")
}
## ^^^ chain stops as soon as it recieves a true
