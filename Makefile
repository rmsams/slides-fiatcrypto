RMEXT=$(PKGNAME).Rcheck $(PKGNAME)_*.tar.gz *.Rout .Rhistory *.nav *.out *.snm *.toc *.aux *.log *~ 
TEX=lualatex

slides.pdf: charts
	$(TEX) slides.tex

charts: 
	Rscript btcusd.R

data:
	Rscript btcusd-quandl.R

clean:
	rm -Rf $(RMEXT)
