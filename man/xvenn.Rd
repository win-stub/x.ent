\name{xvenn}
\alias{xvenn}
\title{
  Graph \code{xvenn}
}
\description{
  Here is a graph of type Venn diagram. The Venne that shows all possible logical relations between a finite collection of sets. Graph \code{xvenn} provides funtionality that users can compare values of entities or relations appearing simultaneously in bulletins. 
}
\usage{
xvenn(v,e=NULL)
}
\arguments{
  \item{v}{ a vector of values, this vector must be greater than 2 }
  \item{e}{ a vector of entities, e.x: "m", "b"}
}
\details{
  Result after calling the function \code{xparse} has the following format:
  \enumerate{
              \item file_name:entity:$:list_value_found
              \item ...
              \item file_name:entity1:entity2:...:$$:value_e1:value_e2:....:negation
            }
  Function \code{xvenn} will convert the data format above to a vector. The \code{xvenn} uses this vector to display graph of type Venn.
  The vector format: 
  \enumerate{
              \item element1 : number of occurences element1 in bulletins
              \item element2 : number of occurences element2 in bulletins
              \item element3 : number of occurences element3 in bulletins\cr
              ...
              \item element1&element2 : number of simutaneous occurences element1 and element2 in bulletins
              \item element2&element3 : number of simutaneous occurences element2 and element3 in bulletins
              \item element3&element1 : number of simutaneous occurences element3 and element1 in bulletins  
              \item element1&element2&element3 : number of simutaneous occurences element1, element2 and element3 in bulletins\cr
              ...
            }
}
\value{
This function returns a vector so that users can check or use it to create new graphs.
\item{vector}{return a vector has format above}
}
\author{
  Tien T. Phan
}
\seealso{
  \code{\link{xhist}} type graphique histogram\cr
  \code{\link{xplot}} type graphique plot\cr
  \code{\link{xprop}} type graphique propotion\cr
}
\examples{
  xvenn(v=c("chou","colza"))
  xvenn(v=c("chou","colza","orge"))
  xvenn(v=c("chou","colza","orge"),e=c("b","m"))
}
\keyword{graphe}
\keyword{venn diagram}
