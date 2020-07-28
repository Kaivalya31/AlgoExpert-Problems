#Create first DF
producers <- data.frame(   
  surname =  c("Spielberg","Scorsese","Hitchcock","Tarantino","Polanski"),    
  nationality = c("US","US","UK","US","Poland"),    
  stringsAsFactors=FALSE)

#Create second DF
movies <- data.frame(    
  surname = c("Spielberg",
              "Scorsese",
              "Hitchcock",
              "Hitchcock",
              "Spielberg",
              "Tarantino",
              "Polanski"),    
  title = c("Super 8",
            "Taxi Driver",
            "Psycho",
            "North by Northwest",
            "Catch Me If You Can",
            "Reservoir Dogs","Chinatown"),                
  stringsAsFactors=FALSE)

#Merging both DFs
m1 <- merge(producers, movies, by.x = "surname")
m1
dim(m1)

#Adding new column and row to DF m1
m1 = cbind(m1, data.frame(
  "Budgetinlacs$" = c(8.07,31,60,13,450,520,12)))
m1 = rbind(m1, data.frame
           ("surname"="Starkey", "nationality"="American", 
             "title"="Forrest Gump", "Budgetinlacs$"="550"))

#Getting a subset of m1
Subsetofm1 = subset(m1, m1[[2]] == "US")

#Editing third row and second col of m1
m1[3,2] = "Netherlands"

#Delete last row of m1
m1 = m1[-8,]

#Melt, Decast, Recast Operations :-
df = data.frame("Name"=c("Senthil","Senthil","Sam","Sam"),
                "Month"=c("Jan", "Feb", "Jan", "Feb"),
                "BS" = c(141.2, 139.3, 135.2, 160.1),
                "BP" = c(90,78,80,81))
install.packages("reshape2")
library(reshape2)
df2 = melt(df, id.vars=c("Month","Name"),
           measure.vars=c("BS","BP"))
df3 = dcast(df2, variable+Month~Name,
            value.var = "value" )
df4 = recast(df, variable+Month~Name, 
             id.var = c("Month", "Name"))