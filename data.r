
# Load the required libraries
library(tidyr)
library(data.table)


# Setup DATA and Cleanup 

# List all the files in the DATA folder
folder_names <- paste0("DATA/", 1:36)
print(folder_names)

# List all the files in the DATA folder
file_list <- list.files(path = folder_names, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)
print(file_list)

# Read the data from the files
data_list <- lapply(file_list, read.table, header = TRUE, sep = "\t")
print(str(data_list[1]))
print(data_list)

# Combine all the data into a single data frame

combined_data <- rbindlist(data_list)
print(combined_data)

# Remove rows with missing values
clean_data <- drop_na(combined_data)
print(clean_data)

# Remove rows where values are 0
clean_data <- clean_data[apply(clean_data != 0, 1, all), ]

# export clean data to a csv file
clean_data_file <- "clean_data.csv"
write.csv(clean_data, file = clean_data_file, row.names = FALSE)
print(clean_data_file)
