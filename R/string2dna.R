#' String to DNA encoder/decoder
#'
#' Encode a string into a DNA sequence or decode a DNA sequence into a string.
#'
#' @param x A string
#' @param method Either `encode` (turn a string into a nucleotide sequence), or `decode` (turn a nucleotide sequence into a string).
#'
#' @return A string
#' @export
#'
#' @examples
#' string2dna("Stephen Turner", method="encode")
#' string2dna("TGATAGCTAGAGCGTCTACTCAGCTAGGATCACCTCCTACAC", method="decode")
string2dna <- function(x, method="encode") {
  if (method=="encode") {
    letters <- toupper(strsplit(x, "")[[1]])
    if (!all(letters %in% codebook$letter)) stop("Invalid character in string.")
    codons <- codebookv[letters]
    string <- paste(codons, collapse="")
    return(string)
  } else if (method=="decode") {
    if (nchar(x) %% 3 != 0) stop("Nucleotide sequence must be a multiple of 3.")
    if (!all(sort(unique(strsplit(x, split="")[[1]])) %in% c("A","C","G","T"))) stop("Bases must be one of: A, C, G, T.")
    codons <- strsplit(toupper(x), '(?<=.{3})', perl=TRUE)[[1]]
    letters <- stats::setNames(names(codebookv), codebookv)[codons]
    string <- paste(letters, collapse="")
    return(string)
  } else {
    stop("method must be one of: encode, decode")
  }
}