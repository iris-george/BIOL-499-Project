# first thing is install the R version
FROM r-base:4.1.0 
# always put the version that you want this particular repository to run on 
# set the working directory:
WORKDIR /main 
# telling R where to look and installing packages
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-06-09')); \
  install.packages('readr'); install.packages('ggplot2')"
# command line specifying what r script to run 
CMD ["Rscript", "__main__.R"]
  

# all capital words are Docker commands
# can make comments in a Dockerfile, but only at the beginning of lines