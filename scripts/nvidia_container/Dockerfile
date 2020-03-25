# FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu16.04
# FROM nvcr.io/nvidia/tensorrt:19.09-py3
# nVidia TensorRT Base Image
# FROM nvcr.io/nvidia/tensorrt:19.10-py3

FROM nvcr.io/nvidia/pytorch:19.10-py3

ARG WORKPATH=/home
WORKDIR $WORKPATH

RUN apt-get update &&\
    apt-get install -y \
    software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update &&\
    apt-get install -y \
    gcc-7 vim wget curl libsm6 libxext6 libxrender-dev

COPY protobuf_install.sh $WORKPATH/
RUN bash $WORKPATH/protobuf_install.sh

COPY requirements.txt $WORKPATH/
RUN pip install --upgrade pip
RUN pip install Cython==0.29.13
RUN pip install numpy==1.17.2
RUN pip install -r requirements.txt

COPY onnx2trt_install.sh $WORKPATH/
RUN bash $WORKPATH/onnx2trt_install.sh

COPY bazel_install.sh $WORKPATH/
RUN bash $WORKPATH/bazel_install.sh

COPY opencv_install.sh $WORKPATH/
RUN bash $WORKPATH/opencv_install.sh

RUN pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/cuda/10.0 nvidia-dali

COPY apex_install.sh $WORKPATH/
RUN bash $WORKPATH/apex_install.sh

COPY ninja_install.sh $WORKPATH/
RUN bash $WORKPATH/ninja_install.sh