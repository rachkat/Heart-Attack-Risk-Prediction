# R Lab 1: Data Structures & EDA (Reproducible Script)

This repository converts an interactive R console transcript into a **clean, runnable script** that demonstrates core R skills and exploratory data analysis (EDA).
It also includes a **PDF** for a related analytics project: predicting second heart attack risk.

## What's Inside
- `lab1_analysis.R` — cleaned and commented R script covering:
  - Reading data with `read.table`
  - Inspecting with `head`, `tail`, `summary`
  - Subsetting columns and computing `cor`
  - Working with vectors, factors, lists, matrices, and tables
  - Defining simple helper functions (`std`, `tellme`)
  - Saving intermediate objects to `data/Labs.RData`
- `data/` — place your raw lab files here (see `data/README.md`)
- `docs/Second_Heart_Attack_Risk_Analysis.pdf` — your project PDF

## How to Run
1. Place `lab1_01.txt` and `lab1_02.txt` in the `data/` folder.
2. Open R/RStudio and set your working directory to the project root (or use RStudio Projects).
3. Run:
   ```r
   source("lab1_analysis.R")
   ```
   Outputs (summaries, tables, correlations) will print in the console. A `data/Labs.RData` file will be created.

## Skills Demonstrated
- Data wrangling & EDA
- Understanding R data structures (vectors, factors, lists, matrices, tables, data frames)
- Writing reusable helper functions
- Reproducible project structure & relative paths

## Tools
- R, RStudio

## Notes
- The script uses **relative paths** (no hard-coded `setwd()`), so it runs from the project root.
- Original data is not included. Add your own copies to `data/`.

## Citation
Exercises inspired by:
- *Data Science and Big Data Analytics* (EMC Education Services).
