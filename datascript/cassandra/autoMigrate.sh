#!/usr/bin/env bash
cqlsh -f cql/seshat-tables.cql
cqlsh -f cql/playground-tables.cql
cqlsh -f cql/seshat-data.cql
cqlsh -f cql/playground-data.cql
