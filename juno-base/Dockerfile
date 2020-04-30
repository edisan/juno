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
FROM oraclelinux:7-slim

# Maintainer
LABEL maintainer="ed@ukuplao.com"

# Environment variables
ENV CONDA_HOME=/u01/conda \
    CONDA_INSTALL=https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh \
    NB_HOME=/u01/notebooks \
    OWNER=juno 

ENV PIP=$CONDA_HOME/bin/pip

# Install prereq packages
RUN  yum install -y libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver wget \
  && yum clean all \
  && mkdir -p $NB_HOME \
  && useradd -b /u01 -m -s /bin/bash $OWNER \
  && chown $OWNER:$OWNER -R /u01

# Change to user juno
USER $OWNER

# Get install script and install anaconda
RUN wget --quiet $CONDA_INSTALL -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p $CONDA_HOME && \
    rm ~/anaconda.sh 

# Install flask-restful, django, django-restful
RUN $PIP install flask-restful django djangorestframework

# Volume for notebook files created
VOLUME $NB_HOME

# Copy sample datasets
COPY data $NB_HOME

# Expose port, use either -P or -p 8888:8888 when running image
EXPOSE 8888

# Start up jupyter-notebook on port 8888
CMD ["/bin/bash", "-c", "/u01/conda/bin/jupyter-notebook --notebook-dir=$NB_HOME --ip='*' --port=8888"]

