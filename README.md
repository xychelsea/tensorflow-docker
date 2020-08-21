TensorFlow in Anaconda
-----

[TensorFlow](https://tensorflow.org/) is an open source platform for machine learning. It provides tools, libraries and community resources for researcher and developers to build and deploy machine learning applications. [Anaconda](https://anaconda.com/) is an open data science platform based on Python 3. This container installs TensorFlow through the ```conda``` command with Anaconda in the ```/usr/local/anaconda``` directory. The default user, ```anaconda``` runs a [Tini shell](https://github.com/krallin/tini/) ```/usr/bin/tini```, and comes preloaded with the ```conda``` command in the environment ```$PATH```. Additional versions with [NVIDIA/CUDA](https://hub.docker.com/r/nvidia/cuda/) support and [Jupyter Notebooks](https://jupyter.org/) tags are available.

### NVIDIA/CUDA GPU-enabled Containers

Two flavors provide an [NVIDIA GPU-enabled](https://hub.docker.com/r/nvidia/cuda) container with [TensorFlow](https://tensorflow.org) pre-installed through [Anaconda](https://anaconda.com/).

## Getting the containers

### Vanilla TensorFlow

The base container, based on the ```xychelsea/anaconda3:latest``` [Anaconda 3 container stack](https://hub.docker.com/r/xychelsea/anaconda3) (```xychelsea/anaconda3:latest```) running Tini shell. For the container with a ```/usr/bin/tini``` entry point, use:

```bash
docker pull xychelsea/tensorflow:latest
```

With Jupyter Notebooks server pre-installed, pull with:

```bash
docker pull xychelsea/tensorflow:latest-jupyter
```

### TensorFlow with NVIDIA/CUDA GPU support

Modified versions of ```nvidia/cuda:latest``` container, with support for NVIDIA/CUDA graphical processing units through the Tini shell. For the container with a ```/usr/bin/tini``` entry point:

```bash
docker pull xychelsea/tensorflow:latest-gpu
```

With Jupyter Notebooks server pre-installed, pull with:

```bash
docker pull xychelsea/tensorflow:latest-gpu-jupyter
```

## Running the containers

### Vanilla TensorFlow

```bash
docker run --rm -it xychelsea/tensorflow:latest
```

With Jupyter Notebooks server pre-installed, run with:

```bash
docker run --rm -it -d -p 8888:8888 xychelsea/tensorflow:latest-jupyter
```
### TensorFlow with NVIDIA/CUDA GPU support

```bash
docker run --gpus all --rm -it xychelsea/tensorflow:latest-gpu /bin/bash
```

With Jupyter Notebooks server pre-installed, run with:

```bash
docker run --gpus all --rm -it -d -p 8888:8888 xychelsea/tensorflow:latest-gpu-jupyter
```

## Building the containers

To build either a GPU-enabled container or without GPUs, use the [tensorflow-docker](https://github.com/xychelsea/tensorflow-docker) GitHub repository.

```bash
git clone git://github.com/xychelsea/tensorflow-docker.git
```

### Vanilla TensorFlow

The base container, based on the ```xychelsea/anaconda3:latest``` [Anaconda 3 container stack](https://hub.docker.com/r/xychelsea/anaconda3) (```xychelsea/anaconda3:latest```) running Tini shell:

```bash
docker build -t xychelsea/tensorflow:latest -f Dockerfile .
```

With Jupyter Notebooks server pre-installed, build with:

```bash
docker build -t xychelsea/tensorflow:latest-jupyter -f Dockerfile.jupyter .
```

### TensorFlow with NVIDIA/CUDA GPU support

```bash
docker build -t xychelsea/tensorflow3:latest-gpu -f Dockerfile.nvidia .
```

With Jupyter Notebooks server pre-installed, build with:

```
docker build -t xychelsea/tensorflow:latest-gpu-jupyter -f Dockerfile.nvidia-jupyter .
```

## References

[TensorFlow](https://tensorflow.org)

[NVIDIA CUDA container](https://hub.docker.com/r/nvidia/cuda)

[Anaconda 3](https://www.anaconda.com/blog/tensorflow-in-anaconda)
