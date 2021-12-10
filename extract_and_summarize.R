#Extract data from ASCTB and Azimuth and store their cell IDs and names
source('extract_cts.R')

# Take a set difference between ASCTB cell types and Azimuth celltypes and store the results in csvs
source('merge_cts.R')
