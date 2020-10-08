#!/bin/bash

if [ ! -d bin ]; then
  mkdir bin
fi

cd bin
cmake ..
make -j8 icra_experiments

# 16 GB
ulimit -v 17179869184

for i in {1..200}
do
    echo "Problem ${i}"
    eval "timeout 30m ./icra_experiments -p ${i} -a 0.0"
    eval "timeout 30m ./icra_experiments -p ${i} -a 0.25"
    eval "timeout 30m ./icra_experiments -p ${i} -a 0.5"
    eval "timeout 30m ./icra_experiments -p ${i} -a 0.75"
    eval "timeout 30m ./icra_experiments -p ${i} -a 1.0"
    eval "timeout 30m ./icra_experiments -p ${i} -s"
done
