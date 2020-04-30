# juno
Jupyter Notebooks and other tools on Docker for Machine Learning

## ML Tools
The images contain the following set of tools:

1. anaconda/scikit-learn
2. keras/tensorflow
3. spark/pyspark
4. popular datasets: iris/titanic

## Instructions for build
Pull entire project down to build images
1. Build juno-base first as other images depend on it
2. You can build juno-keras/juno-spark depending on what you want to use.
3. juno-keras depends on a JDK being downloaded first into the build directory

### Example build command
./build.sh juno-base

### Example run command
./run.sh juno-base

### Example copy command to copy notebooks created in container
./copy.sh juno-base

### Example copy command to copy local files to container
./copy.sh juno-base dirorfile

