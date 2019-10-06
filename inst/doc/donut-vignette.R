## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(donut)
set.seed(20092019)
x1 <- runif(100, 0, 2 * pi)
x2 <- runif(100, 0, 3)
DATA <- data.frame(x1, x2)

## ---- echo = FALSE-------------------------------------------------------
got_RANN <- requireNamespace("RANN", quietly = TRUE)

## ---- fig.width=6, fig.height= 4, eval = got_RANN------------------------
library(RANN)
ranges1 <- c(0, 2 * pi)
query1 <- rbind(c(6, 1.3), c(2 * pi, 3), c(3, 1.5), c(4, 0))
res1 <- nnt(DATA, query1, k = 8, torus = 1, ranges = ranges1)
plot(res1, ylim = c(0, 3))

## ---- eval = got_RANN----------------------------------------------------
res1$nn.dists
res1$nn.idx

## ---- fig.width=6, fig.height= 4, eval = got_RANN------------------------
ranges <- rbind(c(0, 2 * pi), c(0, 3))
query <- rbind(c(6, 1.3), c(2 * pi, 3), c(3, 1.5), c(4, 0))
res2 <- nnt(DATA, query, k = 8, torus = 1:2, ranges = ranges)
plot(res2)

## ---- echo = FALSE-------------------------------------------------------
got_nabor <- requireNamespace("nabor", quietly = TRUE)

## ---- fig.width=6, fig.height= 4, eval = got_nabor-----------------------
library(nabor)
ranges <- rbind(c(0, 2 * pi), c(0, 3))
query <- rbind(c(6, 1.3), c(2 * pi, 3), c(3, 1.5), c(4, 0))
res2 <- nnt(DATA, query, k = 8, fn = nabor::knn, torus = 1:2, ranges = ranges)
plot(res2)

