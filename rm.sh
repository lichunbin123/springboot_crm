#!/bin/bash

for f in `docker ps -a -q`;do 
	echo $f
	docker rm $f
done
