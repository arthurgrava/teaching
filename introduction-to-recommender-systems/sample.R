BASE_DIR = "/Users/arthur/development/personal/git/teaching"

# add custom functions
source(paste(BASE_DIR, "introduction-to-recommender-systems/popularity.R", sep="/"))
source(paste(BASE_DIR, "introduction-to-recommender-systems/ratings.R", sep="/"))
source(paste(BASE_DIR, "introduction-to-recommender-systems/wxax.R", sep="/"))
source(paste(BASE_DIR, "introduction-to-recommender-systems/imprime.R", sep="/"))

# read sample file
data = read.csv(
    paste(BASE_DIR, "data/sample.csv", sep="/")
)

populares = popularidade(data)
avaliados = rankingAvaliacoes(data)
avaliadosNormalizado = rankingAvaliacoesNormalizado(data)
wvav = qxax(data)

imprime(populares)
imprime(avaliados)
imprime(avaliadosNormalizado)
