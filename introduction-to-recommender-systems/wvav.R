quemInteragiuComItemTambemInteragiu <- function (data, item) {
    # recupera os usuários que interagiram com determinado item
    pessoasQueViram = c()
    for (linha in 1:length(data[, item])) {
        elemento = data[linha, item]
        if (!is.na(elemento) & elemento > 0) {
            pessoasQueViram = c(pessoasQueViram, linha)
        }
    }

    items = colnames(data)[-1]
    qvtv <- as.data.frame(setNames(
        replicate(length(items), numeric(1), simplify = F)
    , items))

    for (pessoa in pessoasQueViram) {
        for (idx in 1:length(data[pessoa, ][-1])) {
            candidato = data[pessoa, idx + 1]
            if (!is.na(candidato) & candidato > 0 & items[idx] != item) {
                qvtv[items[idx]] = qvtv[items[idx]] + 1
            }
        }
    }

    return(sort(qvtv, decreasing=T))
}

qxax <- function (data) {
    items = colnames(data)[-1]
    len = length(items)
    recommendations <- as.data.frame(matrix(0, nrow=len, ncol=len))
    rownames(recommendations) <- items
    colnames(recommendations) <- items

    for (item in items) {
        tmp = quemInteragiuComItemTambemInteragiu(data, item)
        for (ele in colnames(tmp)) {
            recommendations[item, ele] = tmp[ele]
        }
    }

    return(recommendations)
}
