# TensorFlow Dockerfile for Anaconda with TensorFlow stack
# Copyright (C) 2020  Chelsea E. Manning
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM xychelsea/anaconda3:v0.1.3
LABEL description="TensorFlow Vanilla Container"

# $ docker build -t xychelsea/tensorflow:latest -f Dockerfile .
# $ docker run --rm -it xychelsea/tensorflow:latest /bin/bash
# $ docker push xychelsea/tensorflow:latest

ENV ANACONDA_ENV=tensorflow_env

# Start as root
USER root

# Update packages
RUN apt-get update --fix-missing \
    && apt-get -y upgrade \
    && apt-get -y dist-upgrade

# Switch to user "anaconda"
USER ${ANACONDA_UID}
WORKDIR ${HOME}

# Update Anaconda
RUN conda update -c defaults conda

# Install TensorFlow
RUN conda create -c conda-forge -n tensorflow_env \
        ca-certificates==2020.12.5 \
        chardet==3.0.4 \
        idna==2.10 \
        python==3.8.6 \
        setuptools==49.6.0 \
        six==1.15.0 \
        tensorboard==2.4.1 \
        tensorboard-plugin-wit==1.8.0 \
        werkzeug==1.0.1 \
        wheel==0.36.2 \
    && pip install tensorflow==2.4.1 \
    && rm -rvf ${ANACONDA_PATH}/share/jupyter/lab/staging

# Switch back to root
USER root

# Clean Anaconda
RUN conda clean -afy \
    && fix-permissions ${HOME} \
    && fix-permissions ${ANACONDA_PATH}

# Clean packages and caches
RUN apt-get --purge -y autoremove \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    && rm -rvf /home/${ANACONDA_PATH}/.cache/yarn

# Re-activate user "anaconda"
USER $ANACONDA_UID
WORKDIR $HOME
