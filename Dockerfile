FROM jolokia/java-jolokia:8

# Install packages
RUN apt-get update && apt-get install -y ruby 
  
ENV CLASSPATH /maven/*:/maven

RUN mkdir /maven
RUN mkdir /app
RUN mkdir /app/bin
RUN mkdir /app/etc

EXPOSE 8778

ADD run.sh /app/bin
CMD ["/app/bin/run.sh"]

