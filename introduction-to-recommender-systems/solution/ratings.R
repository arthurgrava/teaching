avaliacaoMediaDeUmItem <- function (data, item) {
    ocorrencias = length(data[ ,item])
    elementos = data[ ,item]

    contagem = 0.0
    avaliacoes = 0.0
    for (avaliacao in elementos) {
        if (!is.na(avaliacao) & avaliacao != 0) {
            contagem = contagem + 1.0
            avaliacoes = avaliacoes + avaliacao
        }
    }

    return(avaliacoes / contagem)
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
    temp = ((valor - minimo) * (beta - alpha)) / (maximo - minimo)
    return(alpha + temp)
}

rankingAvaliacoesNormalizado <- function (data, alpha=0.5, beta=1.0) {
    items = colnames(data)[-1]

    contagem = popularidade(data)
    minimo = min(contagem)
    maximo = max(contagem)

    avaliacoes = rankingAvaliacoes(data)

    for (item in items) {
        termo = termoNormalizador(contagem[item], minimo, maximo, alpha, beta)
        avaliacoes[item] = avaliacoes[item] * termo
    }

    return(sort(avaliacoes, decreasing=T))
}
