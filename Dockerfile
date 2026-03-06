<<<<<<< HEAD
FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/ROOT

=======
FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/ROOT

>>>>>>> d37f23823b8af8aa8769830831416a8051ff6c7c
COPY web /usr/local/tomcat/webapps/ROOT