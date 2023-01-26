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









