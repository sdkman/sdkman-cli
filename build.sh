#!/bin/bash
export GVM_SERVICE="http://localhost:8080"
export GVM_DIR="/tmp/gvm"
gradle -i clean test
