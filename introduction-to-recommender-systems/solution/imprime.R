imprime <- function (data) {
    colunas = colnames(data)

    for (coluna in colunas) {
        cat(paste(
            coluna,
            data[coluna],
            "\n"
        ))
    }
}
