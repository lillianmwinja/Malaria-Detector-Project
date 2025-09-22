URL<-"https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/lancet_malaria.txt"

malaria_dataset<- read.delim(URL, header = TRUE, stringsAsFactors = FALSE)

#Cleaning dataset
library(dplyr)
malaria_clean <- malaria_dataset %>%
  mutate(across(where(is.numeric), ~ ifelse(is.na(.), 0, .)))

malaria_step1 <- malaria_dataset %>%
  mutate(across(where(is.character), ~ ifelse(is.na(.), "Unknown", .)))


# %PCR Vs % Microscopy
# Scatter plot of % Microscopy vs % PCR
plot(malaria_step1$X..Microscopy..Positive,
     malaria_step1$X..PCR..Positive,
     xlab = "% Microscopy Positive",
     ylab = "% PCR Positive",
     main = "PCR % vs Microscopy %",
     pch = 19,      # solid circles
     col = "blue")

# Add 1:1 reference line (dotted)
abline(0, 1, lty = 2, col = "red")

#Calculating the prevalence ratio and adding it to the dataframe
malaria_step1$Prevalence_Ratio <- malaria_step1$Microscopy.N.Positive/ malaria_step1$PCR.N.Positive

#%PCR Vs %Microscopy for the four global malaria regions
# plotting area
par(mfrow = c(2, 2))

# Asia&Oceania
with(subset(malaria_step1, Global.Region == "Asia&Oceania"),
     {
       plot(X..Microscopy..Positive, X..PCR..Positive,
            xlab = "% Microscopy Positive", ylab = "% PCR Positive",
            main = "Asia and Oceania", pch = 19, col = "orange")
       abline(0, 1, lty = 2, col = "purple")
     })

# West Africa
with(subset(malaria_step1, Global.Region == "West Africa"),
     {
       plot(X..Microscopy..Positive, X..PCR..Positive,
            xlab = "% Microscopy Positive", ylab = "% PCR Positive",
            main = "West Africa", pch = 19, col = "orange")
       abline(0, 1, lty = 2, col = "purple")
     })

# East Africa
with(subset(malaria_step1, Global.Region == "East Africa"),
     {
       plot(X..Microscopy..Positive, X..PCR..Positive,
            xlab = "% Microscopy Positive", ylab = "% PCR Positive",
            main = "East Africa", pch = 19, col = "orange")
       abline(0, 1, lty = 2, col = "purple")
     })

# South America
with(subset(malaria_step1, Global.Region == "South America"),
     {
       plot(X..Microscopy..Positive, X..PCR..Positive,
            xlab = "% Microscopy Positive", ylab = "% PCR Positive",
            main = "South America", pch = 19, col = "orange")
       abline(0, 1, lty = 2, col = "purple")
     })



# Boxplot of prevalence ratio by region
par(mfrow = c(1, 1))   # back to single plot

boxplot(Prevalence_Ratio ~ Global.Region, data = malaria_step1,
        xlab = "Global Region", ylab = "Prevalence Ratio (Microscopy / PCR)",
        main = "Prevalence Ratio by Region",
        col = "lightblue", las = 2, cex.axis = 0.8)

# Add a reference line at ratio = 1
abline(h = 1, lty = 2, col = "red")





       
