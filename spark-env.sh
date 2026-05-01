#!/bin/bash
# spark-env.sh - Set up Spark environment with Java 17

# Set Java 17 as the default for Spark
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"

# Optional: Set Spark local IP to avoid loopback warnings
export SPARK_LOCAL_IP=127.0.0.1

echo "Spark environment configured:"
echo "  JAVA_HOME=$JAVA_HOME"
echo "  Java version: $(java -version 2>&1 | head -1)"
