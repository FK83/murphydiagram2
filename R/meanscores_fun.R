#' Mean score function constructors
#' 
#' Creating functions for the computation of mean elementary scores.
#' 
#' @param m an object inheriting from class "murphydiag".
#' @inheritParams elementaryscores
#'   
#' @return A function in two arguments: 
#'   \tabular{ll}{
#'   \code{t} \tab an object convertible by \code{as.vector}
#'  containing treshold values.\cr
#'   \code{right} \tab logical, indicating if the scores are
#'   right-continuous in \code{t}.
#'   }
#' 
#' @name meanscores_fun
NULL


#' @rdname meanscores_fun
#' @export ms_fun
ms_fun <- function(m) {
  stopifnot(inherits(m, "murphydiag"))
  function(t, right.cont = TRUE, simplify = TRUE) {
    args <- list(t, right.cont)
    sapply(
      m$md_fun,
      function(FUN) do.call(FUN, args),
      simplify = simplify
    )
  }
}
#   switch(m$functional$type,
#          mean = ms_mean_fun(m$x, m$y),
#          prob = ms_prob_fun(m$x, m$y),
#          median = ms_median_fun(m$x, m$y),
#          quantile = ms_quant_fun(m$x, m$y, m$functional$level),
#          expectile = ms_expect_fun(m$x, m$y, m$functional$level))
# }


#' @rdname meanscores_fun
#' @export ms_mean_fun
ms_mean_fun <- function(x, y)
  function(t, right = FALSE) ms_mean(t, x, y, right)


#' @rdname meanscores_fun
#' @export ms_prob_fun
ms_prob_fun <- function(x, y)
  function(t, right = FALSE) ms_prob(t, x, y, right)


#' @rdname meanscores_fun
#' @export ms_median_fun
ms_median_fun <- function(x, y)
  function(t, right = FALSE) ms_median(t, x, y, right)


#' @rdname meanscores_fun
#' @export ms_quant_fun
ms_quant_fun <- function(x, y, level)
  function(t, right = FALSE) ms_quant(t, x, y, level, right)


#' @rdname meanscores_fun
#' @export ms_expect_fun
ms_expect_fun <- function(x, y, level)
  function(t, right = FALSE) ms_expect(t, x, y, level, right)
