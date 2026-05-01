.PHONY: spark-shell spark-python spark-jupyter spark-test help

# Set environment for Spark
SHELL:=/bin/bash
JAVA_HOME:=/usr/lib/jvm/java-17-openjdk-amd64
export JAVA_HOME
export PATH:=$(JAVA_HOME)/bin:$(PATH)
export SPARK_LOCAL_IP:=127.0.0.1

help:
	@echo "Spark Development Commands:"
	@echo "  make spark-test          Run PySpark test"
	@echo "  make spark-python FILE=script.py  Run a PySpark script"
	@echo "  make spark-jupyter       Start Jupyter with Spark"
	@echo ""
	@echo "Example:"
	@echo "  make spark-python FILE=06-batch/code/06_spark_sql.py"

spark-test:
	@source spark-env.sh && uv run python - << 'EOF'
from pyspark.sql import SparkSession
spark = SparkSession.builder.master('local[*]').appName('test').getOrCreate()
print(f'✓ Spark {spark.version} running successfully')
print(f'✓ Range count: {spark.range(10).count()}')
spark.stop()
EOF

spark-python:
	@if [ -z "$(FILE)" ]; then echo "Usage: make spark-python FILE=script.py"; exit 1; fi
	@source spark-env.sh && uv run python $(FILE)

spark-jupyter:
	@source spark-env.sh && uv run jupyter lab

spark-shell:
	@source spark-env.sh && uv run pyspark
