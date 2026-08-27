# My first R script

# Check your version of R and save it as a variable
R_version <- R.version.string

# 
if(R_version == "R version 4.5.1 (2025-06-13)") {
    print("R version 4.5.1")
} else {
    print("You are using a different version of R. Switch to version 4.5.1 to ensure reproducibilty")
  }

