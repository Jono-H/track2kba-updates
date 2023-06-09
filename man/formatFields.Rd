% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/formatFields.R
\name{formatFields}
\alias{formatFields}
\title{Format tracking data}
\usage{
formatFields(
  dataGroup,
  formatBL = FALSE,
  fieldID,
  fieldLat,
  fieldLon,
  fieldDateTime = NULL,
  fieldDate = NULL,
  fieldTime = NULL,
  formatDT = NULL,
  cleanDF = FALSE
)
}
\arguments{
\item{dataGroup}{data.frame or data.table.}

\item{formatBL}{logical. Is data set already in format of BirdLife Seabird
tracking database? If so, indicate \code{TRUE}. \code{fieldID} must still be
specified and other fields may be ignored.
arguments.}

\item{fieldID}{character. Unique identifier; e.g. for individuals or
dataGroup.}

\item{fieldLat}{numeric. Name of column corresponding to the LATITUDINAL
positions.}

\item{fieldLon}{numeric. Name of column corresponding to the LONGITUDINAL
positions.}

\item{fieldDateTime}{character. If existing, this is the name of the column
corresponding to the combined DATE & TIME.}

\item{fieldDate}{character. Name of column corresponding to the DATE only.}

\item{fieldTime}{character. Name of column corresponding to the TIME only.}

\item{formatDT}{character. What is the format of the data in your DateTime,
Date, and Time columns (e.g. "ymd_HMS")? Specify the format following the
standard in \code{\link[lubridate]{parse_date_time}}.}

\item{cleanDF}{logical scalar (T/F). Should columns which are non-essential
for track2KBA analysis be removed from dataframe, or not? Removal will speed
analysis up a bit.}
}
\value{
Returns a data.frame, with 'ID', 'Latitude', 'Longitude', and
'DateTime' (class POSIXct) columns.
}
\description{
\code{formatFields} formats the column names of a data frame so that they are
 accepted by track2KBA functions.
}
\details{
If data are already in format of BirdLife Seabird tracking database
(\url{http://www.seabirdtracking.org/}), use \code{formatBL = TRUE} and formatting
conversion will occur automatically. I.e., data have following columns:
"latitude", "latitude", "date_gmt", "time_gmt". You must still specify the
ID column as either the track or animal identifier.

By matching up the names of your existing columns with those recognized by
track2KBA functions, \code{formatFields} re-formats the data frame, and
converts the date/date-time fields into a singe date-time field of class
POSIXct.


If date-time is combined in a single column, please use \emph{fieldDateTime}
instead of \emph{fieldDate} and \emph{fieldTime}.
}
\examples{
## Load example dataset
tracks_raw <- track2KBA::boobies
## using data with user-custom format i.e. with separate Date and Time fields
tracks_formatted <- formatFields(
  dataGroup = tracks_raw,
  fieldID   = "track_id",
  fieldLat  ="latitude",
  fieldLon  ="longitude",
  fieldDate ="date_gmt",
  fieldTime ="time_gmt"
  )
## using data with only single Date field
tracks_formatted <- formatFields(
  dataGroup = tracks_raw,
  fieldID   = "track_id",
  fieldLat  ="latitude",
  fieldLon  ="longitude",
  fieldDate ="date_gmt",
  formatDT = "ymd"
  )
\dontrun{
## if data were downloaded from Seabird Tracking Database
tracks_formatted <- formatFields(
  dataGroup=tracks_raw,
  formatBL,
  fieldID = "bird_id")
  }
  
}
