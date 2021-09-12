#' Sequences distance network
#'
#' @description Computes pairwise string distances among repertoire's sequences and visualize similar pairs as connected nodes, each sized by its frequency.
#'
#' @param dataset A matrix or a data frame includes row names which are used as the compared sequences. Data set's numeric values determine node-size.
#' @param by Index of column to set its values as node-size. first column is default (1).
#' @param nrow Number of nodes to display. Default is 1000 nodes.
#' @param method stringdist method to perform for distance dissimilarity calculation ("osa", "lv", "dl", "hamming", "lcs", "qgram", "cosine", "jaccard", "jw", "soundex"). Default is "lv" (Levenshtein distance).
#' @param ... Any additional arguments needed by the specialized methods.
#'
#' @export
#'
#' @examples
#'
#' data <- matrix(rexp(1/2, n=4000), ncol = 4)
#' aa <- c('G', 'A', 'V', 'L', 'I', 'P', 'F', 'Y', 'W', 'S',
#'         'T', 'N', 'Q', 'C', 'M', 'D', 'E', 'H', 'K', 'R')
#'
#' cons <- sample(aa, 10)
#'
#' aa_list <- c()
#' while(length(aa_list)<nrow(data)) {
#'   aaseq <- cons
#'   index <- sample(length(aaseq), 3)
#'   aaseq[index] <- sample(aa, 3, replace = TRUE)
#'   aaseq <- paste0(aaseq, collapse = "")
#'   aa_list <- if (!(aaseq %in% aa_list)) append(aa_list, aaseq)
#' }
#'
#' rownames(data) <- aa_list
#' network(data, by = 3, nrow = 500)
#'
#'
network <- function (dataset, by, nrow, method, ...) {
  UseMethod("network")
}



#' Sequences distance network
#'
#' @description Computes pairwise string distances among repertoire's sequences and visualize similar pairs as connected nodes, each sized by its frequency.
#'
#' @param dataset A matrix or a data frame includes row names which are used as the compared sequences. Data set's numeric values determine node-size.
#'
#'
#'
#' @param by Index of column to set its values as node-size. first column is default (1).
#' @param nrow Number of nodes to display. Default is 1000 nodes.
#' @param method stringdist method to perform for distance dissimilarity calculation: "osa", "lv", "dl", "hamming", "lcs", "qgram", "cosine", "jaccard", "jw", "soundex". Default is Levenshtein distance ("lv").
#' @param ... Any additional arguments needed by the specialized methods.
#'
#' @import utils
#' @importFrom igraph simplify graph.data.frame V cluster_louvain layout_with_fr
#' @importFrom stringdist stringdistmatrix
#' @importFrom reshape2 melt
#' @importFrom grDevices rainbow
#'
#' @export
#'
#'
network.default <- function(dataset, by=1, nrow=1000, method="lv", ...) {
  mat <- dataset[order(dataset[,by],decreasing = TRUE),]
  if (nrow(mat) > nrow) mat <- mat[1:nrow,]

  dist_d <- as.matrix(stringdistmatrix(rownames(mat),method = method))
  dist_d[dist_d>2|dist_d==0] <- NA
  colnames(dist_d) <- rownames(mat)
  rownames(dist_d) <- rownames(mat)

  pairs <- unique(melt(dist_d, varnames = c("seq1","seq2"), na.rm = TRUE))
  pairs <- pairs[!is.na(pairs$value),]

  g <- simplify(graph.data.frame(d=pairs, vertices=rownames(mat), directed=FALSE))
  V(g)$size <- mat[,by]
  lou <- cluster_louvain(g)
  l <- layout_with_fr(g)
  V(g)$color <- rainbow(length(unique(lou$membership)), alpha=0.5)[lou$membership]
  plot(g, layout=l, vertex.label = NA, edge.arrow.size = 0, edge.color = "gray")
}
