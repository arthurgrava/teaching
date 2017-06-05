popularidadeItemEspecifico <- function (data, item) {
    # dim(data) retorna o num de linhas e colunas: (linhas, colunas)
    ocorrencias = dim(data[item])[1]

    contagem = 0
    for (idx in 1:ocorrencias) {
        if (!is.na(data[item][idx, 1]) & data[item][idx, 1] != 0) {
            contagem = contagem + 1
        }
    }

    return(contagem)
}

popularidade <- function (data) {
    items = colnames(data)[-1]
    numeroDeItems = length(items)

    vetoresComNome = setNames(
        replicate(numeroDeItems, numeric(1), simplify = F)
    , items)

    pop <- as.data.frame(vetoresComNome)

    for (item in items) {
        pop[item] = popularidadeItemEspecifico(data, item)
    }

    return(sort(pop, decreasing=T))
}
