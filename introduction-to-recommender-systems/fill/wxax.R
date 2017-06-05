quemInteragiuComItemTambemInteragiu <- function (data, item) {
    return(NULL)
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
