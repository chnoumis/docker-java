#!/usr/bin/env bash

DIR="/deployments"

cd ${DIR}/fabric8/etc

for i in * ; do
  if [[ ${i: -4} == ".erb" ]]; then
    erb $i > /app/etc/${i%.*}
  else
    cp $i /app/etc/$i
  fi
done

export JAVA_OPTIONS="$JAVA_OPTIONS $(jolokia_opts)"
if [ -n "$MAIN" ]; then
  exec java $JAVA_OPTIONS -cp $CLASSPATH $MAIN $ARGUMENTS
else
  exec java $JAVA_OPTIONS -jar "/maven/$JAR" $ARGUMENTS
fi
