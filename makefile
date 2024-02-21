# Define tasks
.PHONY: demo
demo:
	@echo "Spawning DuckDB using init.sql"
	duckdb --init init.sql

# Define a default target to display all possible tasks
.PHONY: help
help:
	@echo "Available tasks:"
	@echo "  demo - Spawning a in memory duckDB loading all .csv files as tables"

# By default, when `make` is called without arguments, display help
.DEFAULT_GOAL := help
