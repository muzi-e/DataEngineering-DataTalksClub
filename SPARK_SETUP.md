# Seamless Spark Setup

This repository is configured for seamless PySpark development. No manual environment setup required!

## Quick Start

### Option 1: Using Make (Recommended)

```bash
# Test if Spark works
make spark-test

# Run a PySpark script
make spark-python FILE=06-batch/code/06_spark_sql.py

# Start Jupyter Lab with Spark
make spark-jupyter

# Interactive PySpark shell
make spark-shell
```

### Option 2: Direct Command

```bash
# Source the environment and run Python
source spark-env.sh
uv run python your_script.py
```

### Option 3: Manual Setup

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
uv run python your_script.py
```

## What's Configured

- **Python**: 3.13+ via `uv`
- **PySpark**: 4.1.1 with bundled Spark
- **Java**: Automatic Java 17 setup (avoids compatibility issues with newer Java versions)
- **Jupyter**: Pre-configured for interactive development

## Files

- `pyproject.toml` - Project dependencies
- `uv.lock` - Locked dependency versions
- `spark-env.sh` - Environment setup script
- `Makefile` - Convenient make targets
- `test_spark.py` - PySpark test script

## Troubleshooting

### If Spark fails with "getSubject is not supported"

This means the system Java is too new (22+). The setup automatically uses Java 17 to avoid this.
Just use the provided `make` commands or `spark-env.sh`.

### If imports fail

Ensure you're using `uv run`:
```bash
uv run python script.py
```

Not:
```bash
python script.py  # Wrong - uses system Python
```

## Development Workflow

1. **Write your script** in any `.py` file
2. **Run it** with: `make spark-python FILE=path/to/script.py`
3. **Or use Jupyter**: `make spark-jupyter` and open notebooks

That's it! No more manual environment setup.
