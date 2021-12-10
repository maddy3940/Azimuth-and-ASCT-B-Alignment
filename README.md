## Azimuth-and-ASCT-B-Alignment


This repository contains R script and bash script to reproduce the results of merging two data sources and to create csv files containing Cell Types present in ASCT+B data source but not in Azimuth. The Final output data is in [Data](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/tree/master/Data/Aligned%20Data) folder containing csv files for each organ which has information on Cell Types and their names that are obtained from ASCT+B data source. You can also view the links to the file on this [page](https://maddy3940.github.io/Azimuth-and-ASCT-B-Alignment/)


### Steps to reproduce the results

1) Fork the [master repository](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment)
2) Clone your forked repository
3) If you do not have R install it first. You may follow this [tutorial](https://www.datacamp.com/community/tutorials/installing-R-windows-mac-ubuntu)
4) Find the R installation and add the path to your environment to access R from command line ([Reference](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/)
5) Copy the https link of the forked repository. 

![1](https://user-images.githubusercontent.com/44323045/145530823-174a6541-af88-4e01-abc8-c9e532d76d07.JPG)

Add a new git origin using the following command

```
git remote set-url origin git@github.com/maddy3940/Azimuth-and-ASCT-B-Alignment.git
```

6) Run the script upload.sh 
```
bash upload.sh
```

7) Running the shell script will first install all the dependencies in the R enviornment. Then it will run the script extract_and_summarize.R which will run the R scripts to give you the summarized data in csv format inside the Data folder.
8) You can also set up index file to view the links in a webpage. Like [this](https://maddy3940.github.io/Azimuth-and-ASCT-B-Alignment/) 


### Workflow

1) Data is being downloaded from two sources. 
      a) [Azimuth references formatted as ASCT+B tables](https://hubmapconsortium.github.io/asctb-azimuth-data-comparison/) 
      b) [ASCT+B master tables](https://asctb-api.herokuapp.com/)
2) These files contain the data of cell types and other anatomical structures and substructures. According to my understanding these data come from research conducted by two separate organizations. This data contains information that presents relationships between various anatomical structures and substructures, that are linked to their respective cell types and biomarkers via bimodal networks
3) The purpose of this repositorry is to get the cell type from these two data sets. More specifically each missing cell type with the cell ontology ID that is present in ASCT+B master tables but not in the Azimuth reference and a summary file representing the count of missing cell types present in ASCT+B but not in Azimuth for each organ.
4)  `extract_and_summarize.R` contains the main R script which calls other two scripts.
5) The working is as follows-
  
  a) The script `extract_cts.R` will fetch in the data from the two data sources. The urls and organ name information is present in another json file - `config.json`. 
  
  b) We are only concerned with the Cell type and ontology ID column. So we use grepl command in R to extract only those column names that has `ID` somewhere in the column name    or of type  `AS/1`. (As per my understanding the number present in the column is the hierarchy level of that Cell type)
  
  c) Some Cell IDs are missing but we names are present. We have considered those tuples as well in the above step.
  
  d) We extract those data into a dataframe and export it into a csv file. The IDs and lables obtained from ASCT+B source is stored in the [Asctb](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/tree/master/Data/Asctb) folder whereas data from Azimuth is stored in [Az](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/tree/master/Data/Az)
  
  e) [Original](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/tree/master/Data/Original) folder contains data from [Asctb reference Azimuth](https://hubmapconsortium.github.io/asctb-azimuth-data-comparison/) website. We fetch the Asctb data via Api call from [this](https://asctb-api.herokuapp.com/) endpoint.
  
  f) After extracting IDs and names of cells we store it in a csv file. After that the merge phase begins. 
  
  g) We take a set difference between ASCTB cell types and Azimuth (ASCTB - Azimuth) to get the cell types and names that are in ASCTB but not in Azimuth and we store this information for each organ in [Aligned data](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/tree/master/Data/Aligned%20Data).
  
  h) We store the count of missing IDs and Names in [summary.csv](https://github.com/maddy3940/Azimuth-and-ASCT-B-Alignment/blob/master/Data/Aligned%20Data/summary.csv) file.




