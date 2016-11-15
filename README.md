# -Getting-and-Cleaning-Data-Course-Project

This readme gives an overview of the project structure and the scripts.

## Scripts

### `run_analysis.R`

The goal of this script is to produce the tidy dataset.  For that end it

 * reads the raw data from files in the `UCI HAR Dataset` directory.
 * performs the merging and cleaning steps as per the project specification.
 * saves the tidy dataset as `tidy.txt`.

This script assumes the dataset zip file is already extracted and data files are present in the `UCI HAR Dataset` directory.

## Code book

The code book for the project is in `CodeBook.md`, which describes the variables and data
