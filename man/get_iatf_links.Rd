% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01-get_iatf.R
\name{get_iatf_links}
\alias{get_iatf_links}
\title{Get list of links to IATF resolutions}
\usage{
get_iatf_links(base = "https://www.doh.gov.ph/COVID-19/IATF-Resolutions")
}
\arguments{
\item{base}{URL to the IATF resolutions webpage}
}
\value{
A tibble of links to all the current IATF resolutions
}
\description{
Get list of links to IATF resolutions
}
\examples{
get_iatf_links(base = "http://www.doh.gov.ph/COVID-19/IATF-Resolutions")

}
