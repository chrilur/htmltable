# Et skript for å konvertere tabeller til HTML.

library(xlsx)
tbl <- read.xlsx('tabell.xlsx', header=TRUE, stringsAsFactors=FALSE, sheetIndex=1)
kol <- ncol(tbl)
rad <- nrow(tbl)

#Our needed strings
tr <- "<tr>"
td <- "<td>"
b <- "<strong>"
slb <- "</strong>"
sltd <- "</td>"
sltr <- "</tr>"
start <- "<table width=100%>"
slutt <- "</table>"

#Make the header
topp <- character()
  for (i in 1:kol) {
    topp <- paste0(topp,td,b,names(tbl[i]),slb,sltd)
  }
  topp <- paste0(start,tr,topp,sltr)

#A function that makes one row
lag.rad <- function(r) {
  bodyrad <- character()
  for (m in 1:kol) {
    bodyrad <- paste0(bodyrad,td,tbl[r,m],sltd) 
     }
    bodyrad <- paste0(tr,bodyrad,sltr)
  }

#Assemble all the rows
body <- character()
    for (k in 1:rad) {
      body <- paste0(body,lag.rad(k))
    }

#Paste together the complete table
htmltbl <- paste0(topp,body,slutt)
cat(htmltbl)