#!/bin/bash

cd telegraf

docker build -t telegraf-ipmi -f dockerfile ./
