#!/bin/bash

if dpkg -l apache2; then
echo "apache2 is installed"
else
echo "apache2 is not installed"
fi
