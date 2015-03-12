# RFuncs

Some functions for R.


### rmdfuncs.R

`rmdfuncs.R` contains three functions that help with the typesetting of LaTeX files.

- `startex` captures the latex output from [stargazer](http://cran.r-project.org/web/packages/stargazer/index.html), and deletes the table header and footer it puts on automatically. This allows you to set your own latex table header and footer like so:

```
lm1 <- lm(y ~ x1 + x2 + x3, data=mydata)


cat('''
 \begin{table}[!htbp] \centering 
  \caption{My Neat LaTeX Table} 
  \label{tab:mytable} 
\fontsize{9}{10}\selectfont
\centering
\newcolumntype{d}{D{.}{.}{6}}
\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}
\begin{tabular}{l*{4}{d}}
\toprule
\\[-1.8ex] & \multicolumn{1}{c}{DV} \\ 
\midrule
''')


startex(lm)

cat('''
\bottomrule\\
\textit{Notes:} & \multicolumn{4}{l}{$^{*}$p $<$ 0.05, $^{**}$p $<$ 0.01, $^{***}$p $<$ 0.001} \\ 
\end{tabular}
\fontsize{11}{15}\selectfont 
\end{table}
''')


```


- `al` is short for `autolabel`. It works with the [kfigr](https://github.com/mkoohafkan/kfigr) package to auto-label/auto-number tables and figures. You use it in one of two ways. If you are creating and printing a table in the same knitr chunk, you just input the title:

```
lm1 <- lm(y ~ x1 + x2 + x3, data=mydata)
stargazer(title=al("Effect of Family Commitments on Labor Market Decisions"))
```

If you are printing a table that you created earlier, in a chunk labeled `tabcreate`, you use it like this:

```
lm1 <- lm(y ~ x1 + x2 + x3, data=mydata)
stargazer(title=al("Effect of Family Commitments on Labor Market Decisions", "tabcreate"))
```

You reference a table in the text as usual in `kfigr`.


- `simpleCap` is a helper function for `al`, that capitalizes the first letter of the label.


