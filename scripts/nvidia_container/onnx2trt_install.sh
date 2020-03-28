# apt-get install libprotobuf-dev protobuf-compiler
git clone --recursive https://github.com/onnx/onnx-tensorrt.git
export CUDACXX="/usr/local/cuda-10.1/bin/nvcc"
cd onnx-tensorrt
git checkout 6.0   # to get the rigth api for tensorRT 6.0
mkdir build; cd build
cmake .. -DTENSORRT_ROOT=/usr/src/tensorrt \
-DGPU_ARCHS="61" \
-DCUDA_INCLUDE_DIRS=/usr/local/cuda-10.1/include \
-DProtobuf_INCLUDE_DIR=/usr/include
make -j8
make install
# in onnx-tensorrt/setup.py change to this following to compile on arm
# EXTRA_COMPILE_ARGS =  [
#     '-std=c++11',
#     '-DUNIX',
#     '-D__UNIX',
#     '-fPIC',
#     '-O3',
#     '-ffast-math',
#     '-flto',
#     '-march=armv8-a+crypto',
#     '-mcpu=cortex-a57+crypto',
#     '-w',
#     '-fmessage-length=0',
#     '-fno-strict-aliasing',
#     '-D_FORTIFY_SOURCE=2',
#     '-fstack-protector',
#     '--param=ssp-buffer-size=4',
#     '-Wformat',
#     '-Werror=format-security',
#     '-DNDEBUG',
#     '-fwrapv',
#     '-Wall',
#     '-DSWIG',
# ]