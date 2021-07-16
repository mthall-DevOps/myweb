FROM tomcat:8-jre8
# Dummy text to test
COPY *.war /usr/local/tomcat/webapps

# Git webhook trigger demo
# TO test github push trigger

