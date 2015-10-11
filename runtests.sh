#!/bin/bash
# Run script

echo "Running tests!"
javac Tester.java
java -Xmx6g Tester > last_run_output.txt
