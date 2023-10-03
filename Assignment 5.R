
# Skeleton file 2 for Assignment 1 in BAN400. 
# -------------------------------------------

# Problem 1 ----

library(tidyverse) 
library(ggplot2)

# Read the text
raw_file <- readLines(con = "suites_dw_Table1.txt")

# Locate the beginning of the columns
L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>%
  which() %>% 
  min()

# Create a file containing the variable descriptions
cat(raw_file[1:(L-2)], sep = "\n", file = "variable_description.txt")


# Create a df, seperating by "|" and skipping the first 12 (L - 2) lines
df <- read_delim("suites_dw_Table1.txt", col_names = T, delim = "|", skip = L-2)
df <- df[-1,]

# Create a csv file of the df
write.csv(df, file = "Galaxies.csv", row.names = F)

# Load the csv file as galaxies
galaxies <- read_csv("Galaxies.csv")

# Problem 2 ----

# Plot the different sizes of the galaxies
galaxies %>% 
  ggplot(aes(x = a_26)) +
  geom_histogram(fill = "blue", color = "white") +
  scale_x_log10(labels = scales::number) +
  labs(x = "a_26 (linear diameter of the galaxy in kpc)") +
  theme_dark()

# If I understand the results correctly, the smaller galaxies are NOT under
# represented



