avaliacaoMediaDeUmItem <- function (data, item) {
    result = c()

    return(result)
}

rankingAvaliacoes <- function (data) {
    items = colnames(data)[-1]
    numeroDeItems = length(items)

    vetoresComNome = setNames(
        replicate(numeroDeItems, numeric(1), simplify = F)
    , items)

    pop <- as.data.frame(vetoresComNome)

    for (item in items) {
        pop[item] = avaliacaoMediaDeUmItem(data, item)
    }

    return(sort(pop, decreasing=T))
}

termoNormalizador <- function (valor, minimo, maximo, alpha, beta) {
    return(NULL)
}

rankingAvaliacoesNormalizado <- function (data, alpha=0.5, beta=1.0) {
    return(NULL)
}
