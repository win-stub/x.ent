\name{xconfig}
\alias{xconfig}
\title{
  System configuration
}
\description{
  This function allows users to configure the entire system, such as: paths for corpus, evaluation file, result file, dictionaries ...
}
\usage{
  xconfig(json_path="")
}
\arguments{
  \item{json_path}{path of configuration file (*.json)}
}
\details{
  System configuration
  \pkg{x.ent} uses a file json to configure the entire system. Configuration file structure is very complex and has multiple entries. Easy for the user to manage, we create a web-based interface and use javascript in client-side, code R in the server-side for updating data in the configuration file. The entries in the configuration file:
   \describe{
    \item{corpus}{A path to the directory containing the corpus (text or xml)}
    \item{eval}{A path to the evaluation file}
    \item{result}{A path to the file that will store the results}
    \item{dico}{contain information of a list of dictionary, each dictionary has the following format: the original word and the transformations this word: singular, plural, unaccented word, synonym and acronym, for example with a dictionary of plants:
      \tabular{rlll}{
        \tab wheat:N:Wheat:WHEAT:Wheats:Triticum:Durum wheat:Common wheat:\cr  
        \tab durum wheat:L:DURUM:T. durum:Triticum durum:Triticum turgidum:durums wheats:durum wheat:macaroni wheat:\cr \cr
        \tab The letter N(node) indicates that this category (wheat) may have subcategories (Durum wheat, Common wheat, ...).\cr
        \tab The letter L (leaf) indicates a leaf of a node.\cr
      }
      In this entry, we have to configure the following information:
     \tabular{rll}{
        \tab - tag: a name used to mark results, ex: p for plant, m for disease\cr
        \tab - file: a path to a dictionary file\cr
        \tab - node: if the dictionary contains nodes (N)\cr
        \tab - col_key: the column in the dictionary that contains the original word\cr
        \tab - col_val: the columns in the dictionary that we want to use to search in the corpus\cr
        \tab - get: number of results that we want to get: 1, 2, ..or all from the first position of the document.
     }
    }
    \item{unitex}{
    Unitex, this is a tool that allows you to build grammar and you will extract the data from the grammar that you have built. If you want to use this feature, you can download 
      \href{http://www-igm.univ-mlv.fr/~unitex/index.php?page=3&html=download2.html}{here}.\cr
      In this entry, we have to configure the following information:\cr
      - system\cr
         \enumerate{
            \item tool_unitex: a specified full path to the tool Unitex, the name of the tool is "UnitexToolLogger", you can find in the installation directory.
            \item main_graph: a grammar that you have built, it's like a graph (in Unitex). In your application, you can have many graphs. So you have to use a main graph to link all the sub-graphs.
            \item my_unitex: this is a place that stores local data of Unitex
            \item dico: a list of dictionaries of Unitex
          }
      - result\cr
        \enumerate{
            \item tag: a name used to mark results
            \item tag_unitex: a tag used tp mark in Unitex
            \item get: number of results that we want to get: 1, 2, ..or all from the first position of document
          }
    }
    \item{relation}{
      You can create the relations beetween entities, such as: the relation beetween plants and diseases.
      This is the information that you have to configure:
      \enumerate{
            \item type: there are two options: structure (relation extraction in the following doccument structure) and cooccurrence.
            \item left, right: these parramaters are used in the cooccurrence mode, we setup a window from the left and the right of root entity. 
            \item root: root of relation, ex: p for plant
            \item negative: an entity is used to identify whether the relation is negative or positive
            \item link: details of the relation, ex: plant:disease => p:m.
          }
    }
    \item{avoid}{
    In the document, maybe you don't want to find in a few paragraphs, so you can use this feature. You can create a file according to the following format: key word..phrase or end.\cr
    - phrase: beginning from key word to the end of the paragraph\cr
    - end: beginning from key word to the end of file
    }
    \item{replace}{a path of file that contains words to be replaced. The format:\cr
    - words_will_be_replaced:list_words_need_replacing
    }
    \item{stopword}{a path of file that contains the list of stop words}
    \item{blacklist}{a path of file that contains the list of words for each entity that we do not want to appear in results}
    }
}
\note{
  This package performs well with UTF-8 encoding.
  For configuring UTF-8 encoding on your system:
  In the windows of R, you can type:\cr
  \code{options(encoding="UTF-8")}
}
\author{
  Tien T. Phan
}
\examples{
  xconfig()
  xconfig("C:/JSON/ini.json")
}
\keyword{config}