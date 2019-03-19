FROM kuzmenkov/shinybase:latest


# basic shiny functionality
RUN R -e "install.packages('shinyBS', repos='https://cran.r-project.org/')" \
#&& sudo su - -c "R -e \"options(unzip = 'internal'); devtools::install_version('highcharter', version = '0.5.0', repos = 'https://cran.r-project.org/')\"" \
#RUN R -e "download.file(url = 'http://cran.r-project.org/src/contrib/Archive/highcharter/highcharter_0.3.0.tar.gz', destfile = 'highcharter_0.3.0.tar.gz')"
#RUN R -e "install.packages(pkgs='highcharter_0.3.0.tar.gz', type='source', repos=NULL)"
#RUN R -e "unlink('highcharter_0.3.0.tar.gz')"
&& R -e "install.packages('data.table', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('maptools', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('rgdal', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('future', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('callr', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('future.callr', repos='https://cran.r-project.org/')" \
#&& R sudo su - -c "R -e \"options(unzip = 'internal'); devtools::install_github('HenrikBengtsson/future.callr')\""\
&& R -e "install.packages('tidyr', repos='https://cran.r-project.org/')"\
&& sudo su - -c "R -e \"options(unzip = 'internal'); remotes::install_github('daattali/timevis')\""\
&& R -e "install.packages('shinythemes', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('formattable', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('fst', repos='https://cran.r-project.org/')" \
#&& sudo su - -c "R -e \"options(unzip = 'internal'); devtools::install_version('fst', version = '0.7.2', repos = 'https://cran.r-project.org/')\"" \
&& R -e "install.packages('leaflet.minicharts', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('RColorBrewer', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('grDevices', repos='https://cran.r-project.org/')" \ 
&& R -e "install.packages('gplots', repos='https://cran.r-project.org/')" \ 
&& R -e "install.packages('shinyWidgets', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('shinyjqui', repos='https://cran.r-project.org/')"  \
&& R -e "install.packages('collapsibleTree', repos='https://cran.r-project.org/')"  \
#&& sudo su - -c "R -e \"options(unzip = 'internal'); devtools::install_github('kuzmenkov111/shinyURL')\"" \
&& R -e "install.packages('RCurl', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('shinycssloaders', repos='https://cran.r-project.org/')" \
#&& sudo R -e "install.packages('ReporteRs', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('officer', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('flextable', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('raster', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('digest', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('bcrypt', repos='https://cran.r-project.org/')" \
&& sudo su - -c "R -e \"options(unzip = 'internal'); remotes::install_github('kuzmenkov111/qrencoder')\"" \
&& R -e "install.packages('rgdal', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('mapview', repos='https://cran.r-project.org/')" \
&& R CMD javareconf \
&& R -e "Sys.setenv(JAVA_HOME = '/usr/lib/jvm/java-8-oracle/jre'); install.packages('rJava', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('mailR', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('RPostgres', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('stringi', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('pool', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('DBI', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('GoodmanKruskal', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('rjson', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('uuid', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('shinytoastr', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('promises', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('ipc', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('Hmisc', repos='https://cran.r-project.org/')" \
#&& R -e "install.packages('RcppTOML', repos='https://cran.r-project.org/')" \
&& R -e "install.packages('configr', repos='https://cran.r-project.org/')" \
&& sudo su - -c "R -e \"options(unzip = 'internal'); remotes::install_github('dreamRs/shinyparticles')\"" \
&& R -e "install.packages('arules', repos='https://cran.r-project.org/')" \
&& sudo su - -c "R -e \"options(unzip = 'internal'); remotes::install_github('JohnCoene/waiter')\""



COPY error/ /opt/shiny-server/templates/
#volume for Shiny Apps and static assets. Here is the folder for index.html(link) and sample apps.
VOLUME /srv/shiny-server
EXPOSE 3838


CMD ["/sbin/my_init"]
