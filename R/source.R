#' Visualized for CR Sources
#'
#' @description Visualization of Two clones for their convergent recombination (CR) sources. Each sequence (nucleotides) is represented as a colored bar (red for A, yellow for G, blue for T and green for C) linked to its translated amino acid sequence by a colored line, red for the first clone and blue for the second.
#'
#' @param clone1 First vector of sequences, each is a same length string of nucleotide.
#' @param clone2 Second vector of sequences, same string-length as for the first vector.
#' @param ... Any other arguments.
#'
#' @export
#'
#' @examples
#' nt <- c("A", "G", "C", "T")
#'
#' ntseq <- replicate(30, paste0(sample(nt, 15, replace = TRUE), collapse = ""))
#'
#' c1 <- ntseq[1:17]
#' c2 <- ntseq[18:30]
#'
#' cr_source(c1, c2)
#'
cr_source <- function(clone1, clone2,...) {
  UseMethod("cr_source")
}



#' Visualized for CR Sources
#'
#' @description Visualization of Two clones for their convergent recombination (CR) sources. Each sequence (nucleotides) is represented as a colored bar (red for A, yellow for G, blue for T and green for C) linked to its translated amino acid sequence by a colored line, red for the first clone and blue for the second.
#'
#' @param clone1  First vector of sequences, each is a same length string of nucleotide.
#' @param clone2  Second vector of sequences, same string-length as for the first vector.
#' @param ... Any other arguments.
#'
#' @importFrom circlize circos.initialize circos.track circos.par circos.clear circos.barplot circos.link get.cell.meta.data mm_h circos.rect
#' @importFrom stringr str_replace_all
#' @importFrom grDevices adjustcolor
#'
#' @export
#'
cr_source.default <- function(clone1, clone2,...) {
  ntseq <- c(clone1, clone2)
  n <- length(ntseq)
  len <- nchar(max(ntseq))

  aa_name <- "aa"
  sourse_name <- c("A", "B")

  names(ntseq) <- c(paste0(sourse_name[1], 1:length(clone1)),
                    paste0(sourse_name[2], 1:length(clone2)))
  sectors <- c(names(ntseq), aa_name)

  axes <- matrix(rep(c(0, 1), each = n), ncol = 2)
  axes <- rbind(axes, c(0, n))
  rownames(axes) <- sectors

  circos.clear()
  circos.par$cell.padding <- c(0, 0, 0, 0)
  circos.par$track.margin <- c(0.005, 0.005)
  circos.par$start.degree <- 0
  circos.par$gap.degree <- c(rep(2, n-1), 5, 5)
  circos.par$start.degree <- 90
  circos.par$clock.wise <- FALSE
  circos.par$points.overflow.warning <- FALSE

  circos.initialize(sectors, xlim = axes, sector.width = c(rep(1, n), n/2))
  circos.track(sectors=names(ntseq), x=n:1, ylim=c(0, len), bg.border = NA, track.height = 0.7, panel.fun = function(x, y) {
    # Bars
    i <- get.cell.meta.data("sector.index")
    nt_col <- as.character(ntseq[i])
    nt_col <- rev(unlist(strsplit(nt_col, split = "")))
    nt_col <- str_replace_all(nt_col, c("A" = "tomato", "G" = "khaki1", "T" = "dodgerblue", "C" = "palegreen"))
    circos.barplot(value = len:1, pos = rep(0.5, len), bar_width = .5, col = nt_col, border = adjustcolor("black", alpha.f=.3))
  })

  circos.track(sectors=sectors, x=n:0, ylim=c(0, 1), bg.border = NA, track.height = mm_h(1), panel.fun = function(x, y) {
    # Links
    i <- get.cell.meta.data("sector.index")

    if (i!=aa_name) {
      to <- ifelse(x <= length(clone1), x + length(clone2), x - length(clone1))
      to <- to * max(axes[aa_name,]) / n
      col1 <- adjustcolor("red", alpha.f=.6)
      col2 <- adjustcolor("blue", alpha.f=.6)
      link_col <- ifelse(x <= length(clone1), col1, col2)
      circos.link(i, c(.15, .85), aa_name, c(to-1, to), col = link_col, border = adjustcolor("black", alpha.f=.3))
    }

    circos.rect(get.cell.meta.data("xlim")[1], 0, get.cell.meta.data("xlim")[2], 1, col="darkgrey", border=NA)
  })

  circos.clear()
}
