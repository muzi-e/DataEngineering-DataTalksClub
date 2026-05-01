#!/usr/bin/env python
"""
Test PySpark installation
Run with: make spark-test
or: JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 uv run python test_spark.py
"""

from pyspark.sql import SparkSession
from pyspark.sql import functions as F

# Create a Spark session
spark = SparkSession.builder \
    .master('local[*]') \
    .appName('test') \
    .getOrCreate()

print(f"✓ Spark {spark.version} running successfully")

# Create a test DataFrame
df = spark.range(0, 10)
print(f"✓ Created DataFrame with {df.count()} rows")

# Perform a simple operation
result = df.withColumn('squared', F.col('id') ** 2).agg(F.sum('squared')).collect()
print(f"✓ Sum of squares (0-9): {result[0][0]}")

# Show schema
print("\n✓ Schema:")
df.printSchema()

spark.stop()
print("\n✓ All tests passed!")
