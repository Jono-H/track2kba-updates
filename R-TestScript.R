## Jono trying a different version of loading track2KBA R package
# install_github("Jono-H/track2kba-updates")

## Review loaded packages
library(devtools)
source()
sessionInfo()
session_info()

## trying https://stackoverflow.com/questions/8761857/identifying-dependencies-of-r-functions-and-scripts
## understand dependencies of functions
#install.packages("mvbutils")
library(mvbutils)
library(track2KBA)
library(adehabitatHR)
library(rgdal)
library(rgeos)
library(maptools)
library(sp)

## what functions in track2KBA rely on adehabitatHR
ixWhere <- match(c("package:adehabitatHR","package:track2KBA"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:track2KBA"), descendents = T)
fw$funmat

## what functions in track2KBA rely on sp
ixWhere <- match(c("package:sp","package:track2KBA"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:track2KBA"), descendents = T)
fw$funmat


## what functions in adehabitatHR rely on sp
ixWhere <- match(c("package:sp","package:adehabitatHR"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:adehabitatHR"), descendents = T)
fw$funmat




## what functions in sp rely on rgdal
ixWhere <- match(c("package:rgdal","package:sp"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:sp"), descendents = T, cex = 0.8)
fw$funmat

## what functions in sp rely on rgeos
ixWhere <- match(c("package:rgeos","package:sp"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:sp"), descendents = T, cex = 0.8)
fw$funmat

## what functions in sp rely on maptools
ixWhere <- match(c("package:maptools","package:sp"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:sp"), descendents = T, cex = 0.8)
fw$funmat




## what functions in maptools rely on rgdal
ixWhere <- match(c("package:rgdal","package:maptools"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:maptools"), descendents = T, cex = 0.8)
fw$funmat

## what functions in maptools rely on rgeos
ixWhere <- match(c("package:rgeos","package:maptools"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:maptools"), descendents = T, cex = 0.8)
fw$funmat

##~~~~~~~~~~~~~

## what functions in track2KBA rely on rgdal
ixWhere <- match(c("package:rgdal","package:track2KBA"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:track2KBA"), descendents = T)
fw$funmat

## what functions in track2KBA rely on rgeos
ixWhere <- match(c("package:rgeos","package:track2KBA"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:track2KBA"), descendents = T)
fw$funmat

## what functions in track2KBA rely on maptools
ixWhere <- match(c("package:maptools","package:track2KBA"), search())
fw <- foodweb(where = ixWhere, prune = ls("package:track2KBA"), descendents = T)
fw$funmat

