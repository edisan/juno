# Copyright (c) 2020, Ed Sananikone. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
FROM juno:juno-base

# Maintainer
LABEL maintainer="ed@ukuplao.com"

# Spark URL for download, override from CLI if needed
ARG SPARK_URL=https://apache.claz.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

# Environment variables
ENV PIP=$CONDA_HOME/bin/pip \
	SPARK_HOME=/u01/spark \
	JAVA_HOME=/u01/jdk

# Change to user juno
USER $OWNER

# Get install script and install anaconda
RUN $PIP install pyspark

# Pull Apache Spark and explode tar ball
RUN wget --quiet $SPARK_URL -O ~/spark.tgz \
    && tar zxvf ~/spark.tgz -C ~/ \
    && rm ~/spark.tgz \
    && mv ~/spark* $SPARK_HOME

# Copy script to link spark to jupyter notebook when running pyspark
COPY spark2jup.sh $SPARK_HOME

# Copy jdk tar ball for install, NOTE: Download JDK from otn.oracle.com into
# same directory as Dockerfile
COPY jdk-8u251-linux-x64.tar.gz /u01/juno/jdk.tgz

# Install JDK
RUN tar zxvf ~/jdk.tgz -C ~/ \
    && rm ~/jdk.tgz \
    && mv ~/jdk* $JAVA_HOME

# Expose port, use either -P or -p 8888:8888 when running image
EXPOSE 8888

# Start up jupyter-notebook on port 8888
CMD ["/bin/bash", "-c", ". $SPARK_HOME/spark2jup.sh && $SPARK_HOME/bin/pyspark"]
 

