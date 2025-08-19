# Lab 1: Working with R Data Structures & EDA
# -------------------------------------------------------------
# Author: Rachel Gainer
# Source exercises: "Data Science and Big Data Analytics"
# Purpose: Reproducible version of the interactive lab transcript,
#          cleaned into a runnable script with comments and structure.
# Repo layout expectations:
#   - data/lab1_01.txt
#   - data/lab1_02.txt
#   - docs/Second_Heart_Attack_Risk_Analysis.pdf (portfolio PDF)
# -------------------------------------------------------------

# 0) Setup -----------------------------------------------------
# Use project-relative paths (no hard-coded setwd()).
# If you want to run from any working directory, use here::here().
# install.packages("here") # if needed
# library(here)
# data_dir <- here::here("data")
data_dir <- "data"  # simple relative path

# Helper to join paths safely
path_join <- function(...) {
  paste(..., sep = "/")
}

# 1) Load Data -------------------------------------------------
# Replace with your actual files in /data
lab1_path <- path_join(data_dir, "lab1_01.txt")
lab2_path <- path_join(data_dir, "lab1_02.txt")

# Read the pipe-delimited tables with headers
lab1 <- read.table(lab1_path, sep="|", header=TRUE, stringsAsFactors = FALSE)
lab2 <- read.table(lab2_path, sep="|", header=TRUE, stringsAsFactors = FALSE)

cat("\n--- Inspect lab1 ---\n")
print(head(lab1, 10))
cat("\n--- Inspect lab2 (tail) ---\n")
print(tail(lab2, 10))

cat("\n--- Summary of lab1 ---\n")
print(summary(lab1))

# 2) Subset & Basic EDA ---------------------------------------
# Keep only income (hinc) and rooms columns
nlab1 <- lab1[, c("hinc", "rooms")]

cat("\nDimensions of nlab1: ")
print(dim(nlab1))
cat("typeof(nlab1): "); print(typeof(nlab1))
cat("class(nlab1): "); print(class(nlab1))

cat("\n--- Summary of nlab1 ---\n")
print(summary(nlab1))

# Correlation matrix: hinc vs rooms
cat("\n--- Correlation (nlab1) ---\n")
print(cor(nlab1, use = "complete.obs"))

# 3) Save intermediate objects --------------------------------
# Keep a clean version of lab1 as the 2-column subset
lab1 <- nlab1
save(lab1, lab2, file = path_join(data_dir, "Labs.RData"))
cat("\nSaved lab1 & lab2 to data/Labs.RData\n")

# 4) Scalars, Strings, Vectors --------------------------------
n <- 1  # scalar
s <- "Columbus, Ohio"   # string
levels_vec   <- c("Worst", "Bad", "Mediocre", "Good", "Awesome")
ratings      <- c("Worst", "Worst", "Bad", "Bad", "Good", "Bad", "Bad")
critics      <- c("Siskel", "Ebert", "Rowen", "Martin")
movies       <- c("The Undefeated", "Snakes on a Plane", "Encino Man", "Casablanca")
attendance   <- c(15, 350, 175, 400)
reviewers    <- c("Siskel", "Siskel", "Ebert", "Ebert", "Rowan", "Martin", "Rowan")

# 5) Factors & Lists ------------------------------------------
f <- factor(ratings, levels = levels_vec)
fl <- list(
  ratings = ratings,
  critics = critics,
  movies = movies,
  attendance = attendance
)

# 6) Matrices, Tables, Data Frames -----------------------------
mdat <- matrix(
  c(1,2,3, 11,12,13),
  nrow = 2, ncol = 3, byrow = TRUE,
  dimnames = list(c("row1", "row2"), c("C1", "C2", "C3"))
)

t <- table(ratings, reviewers)  # contingency table
cat("\n--- Contingency table (ratings x reviewers) ---\n")
print(t)

# 7) Functions -------------------------------------------------
std <- function(x) {
  # Wrapper around sd()
  sd(x, na.rm = TRUE)
}

tellme <- function(obj) {
  # Report type, class, str() summary, and names
  cat("\n--- tellme() ---\n")
  cat("typeof: ", typeof(obj), "\n")
  cat("class : ", paste(class(obj), collapse=", "), "\n")
  cat("str   :\n"); print(utils::capture.output(str(obj)))
  nm <- names(obj)
  cat("names : ", if (is.null(nm)) "(none)" else paste(nm, collapse=", "), "\n")
  invisible(NULL)
}

# Test functions
v <- 1:100
cat("\nstd(1:100): ", std(v), "\n")
tellme(t)

# 8) Session Cleanup (optional) --------------------------------
# rm(list = setdiff(ls(), c("lab1", "lab2", "nlab1")))
# gc()
cat("\nScript completed successfully.\n")