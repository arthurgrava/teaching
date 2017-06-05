BASE_DIR = "/Users/arthur/development/personal/git/teaching"

data = read.csv(
    paste(BASE_DIR, "data/sample.csv", sep="/")
)

colnames(data)
