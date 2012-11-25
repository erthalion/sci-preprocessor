#!/bin/sh
awk -f collect_tracing.awk $1 | awk -f replace_tracing.awk > $1.tmp
cat $1.tmp > $1
rm $1.tmp
