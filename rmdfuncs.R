
startex <- function(...){
  plister = as.list(substitute(list(...)))[-1L]
if(!is.null(plister$summary)){
    louts <- capture.output(stargazer(..., header=FALSE))
    lo <- paste(louts,collapse='\n')
    lo2 <- str_replace(lo,perl("(?s)\n\\\\begin\\{.*\\] \n(?=[A-Za-z])"),'')
    lo3 <- str_replace(lo2,perl("(?s)\n\\\\hline.*.*"),'')
    cat(lo3)
  }else{
    louts <- capture.output(stargazer(...))
    lo <- paste(louts,collapse='\n')
    lo2 <- str_replace(lo,perl("(?s)\n\\\\begin\\{.*\\] (?=[A-Za-z])"),'')
    lo3 <- str_replace(lo2,perl("(?s)\n \\\\end\\{tabu.*"),'')
    cat(lo3)
  }
}


simpleCap <- function(x) {
    s <- strsplit(x, " ")[[1]]
    paste(toupper(substring(s, 1, 1)), substring(s, 2),
          sep = "", collapse = " ")
}

al <- function(title, label=NULL){
    require('kfigr')
    if(!is.null(label)){
    lab <- figr(label,link=FALSE,prefix=TRUE)
    lab <- paste(simpleCap(lab),". ",title,sep='')
    return(lab)
    }
    else{
    lab <- figr(opts_current$get("label"),link=FALSE,prefix=TRUE)
    lab <- paste(simpleCap(lab),". ",title,sep='')
    return(lab)
  }
}