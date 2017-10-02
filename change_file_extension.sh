#!/bin/bash

for filename in *.$1  
do  
    mv $filename ${filename%$1}$2  
done
