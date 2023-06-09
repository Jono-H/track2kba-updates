% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/findSite.R
\name{findSite}
\alias{findSite}
\title{Delineating sites of potential importance to conservation}
\usage{
findSite(KDE, represent, popSize = NULL, levelUD, thresh, polyOut = FALSE)
}
\arguments{
\item{KDE}{estUDm or SpatialPixels/GridDataFrame. If estUDm, as created by
\code{\link{estSpaceUse}} or \code{adehabitatHR::kernelUD}, if Spatial*,
each column should correspond to the Utilization Distribution of a single
individual or track.}

\item{represent}{Numeric (between 0-1). Output value provided by
\code{\link{repAssess}} which assesses how representative the tracking data
are for characterising the space use of the wider population.}

\item{popSize}{Numeric, the number of individuals breeding or residing at the
origin location from where animals were tracked, quantifying the population
that the tracking data represent. This number will be used to calculate how
many animals use the delineated areas of aggregation. If no value for
\code{popSize} is provided then output will be as the proportion of the
population.}

\item{levelUD}{Numeric (percentage). Specifies the quantile used for
delineating the core use (or home range) areas of individuals based on the
kernel density estimation (e.g core area=50, home range=95).}

\item{thresh}{Numeric (percentage). Threshold percentage of local source
population needed to be found using a location for it to be considered part
of a 'potentialSite'. Default is set based on degree of representativeness.}

\item{polyOut}{Logical. (Default TRUE) Should the output be a polygon dataset
(TRUE) or grid of animal densities (FALSE). See 'Value' below for more
details.}
}
\value{
if \code{polyOut = TRUE} function returns an object of class
\code{sf} containing polygon data with three data columns:
  Column \code{N_IND} indicates the number of tracked individuals whose core
  use area (at \code{levelUD}) overlapped with this polygon.

  Column \code{N_animals} estimates the number of animals from the
  represented population that predictably use the polygon area during the
  tracked season. If no value for (at \code{popSize}) is provided, this
  number is the proportion of the represented population using the area.

  Column \code{potentialSite} indicates whether the polygon can be considered
   a potential Site (TRUE) or not (FALSE).

if \code{polyOut = FALSE} function returns a gridded surface of class
SpatialPixelsDataFrame, with the same three aforementioned columns as cell
values.

 If \code{polyOut = TRUE} the user may choose to automatically produce a plot
  of the result using \code{plot=TRUE}. The map produced displays the areas
  which hold aggregations above a certain threshold proportion of the
  population. If there are no areas displayed on the map, then either the
  species doesn't aggregate, the Scale is too small to identify aggregations
  in this species, or the tracked sample aren't representative enough to meet
  the thresholds.
}
\description{
\code{findSite} uses the core areas (based on utilization distributions) of
individual animals to identify areas used regularly used by a significant
portion of the local source population (i.e. the tracked population).
}
\details{
\code{findSite} estimates the proportion of the local source population using
an area based on the proportion of overlap among individual core areas and
the degree of representativeness as quantified by \code{\link{repAssess}}).
This value is then compared to a threshold of importance (i.e. a certain % of
 the population) to delineate areas as 'potentialSites'. Thresholds area
either set automatically set on the representativenss of the sample
(lower rep==higher threshold), or set manually by the user.

The areas identified are sites of ecological relevance to the populations,
which may be significant for the wider region or entire species, which cane
 be assessed using global (or regional) criteria, such as those of the Key
Biodiversity Area program.

The KBA criteria for site assessment are published in the KBA standard, which
 may be found here: \url{http://www.keybiodiversityareas.org/}.

If grid used for estimating core areas (i.e. KDE) is very memory-heavy
(e.g. >10,000 cells) use \code{polyOut = FALSE} to speed things up.
}
\examples{
KDE <- track2KBA::KDE_example

## identify potential sites
pot_site <- findSite(KDE, represent = 90, levelUD = 50)

}
