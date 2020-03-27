# Contribution
We follow the [Google Coding Standard](https://google.github.io/styleguide/cppguide.html) for C/C++/Protobuf and [PEP8](https://www.python.org/dev/peps/pep-0008/) for Python development. Linters are already in place to ensure developer efficiency. 

## Environment Setup
We strongly recommend [Visual Studio Code](https://code.visualstudio.com/) as the development environment. After [building](Installation.md) the containers and verifying that they run, please setup your development environment using 
```bash
. scripts/provision develop
```

## Coding Standards

The framework can be split as follows:
1. Core Library (all core functionality and communications with the deep learning library for inference)
2. Interfacing Library (ROS or any other middleware for message passing into the core library from different datasources, visualizations, etc)
3. Microservice Library (to communicate with microservices such as the deep learning framework)
4. Deep Learning Library (the main detection/classification pipeline)

Please follow these as a rule of thumb to contribute to this repository:
1. All core library code should be in C/C++/CUDA
2. Try to limit usage of external libraries as much as possible.
3. Please use meaningful names for variables, functions, classes, etc.
4. Class definitions should be in `*.h` files. If the class is a template (avoid these), accompanying function defintions in `*.hpp` should be added. `*.cpp` files should contain function definitions only for non-template classes
5. Please use [`glog`](https://github.com/google/glog) for all logging inside the core library
6. Visualization code for robot spawning, launching environments, etc can be in either C/C++ or Python (only for parts not communicating with the core library)
7. Microservices are to rely on protobuf messages and will use [gRPC](https://grpc.io/) for passing requests and accepting responses (during inference from the Deep Learning Library) and should be written in proto/C++
8. [PyTorch](https://pytorch.org/) is chosen as the framework of choice for deep learning. Avoid using anything else
9. Please add a doxygen compatible documentation for every function, class, method, etc. For classes and class methods add it only to the `*.h` files. For Python, use the following [guide](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html) from Google
10. Please unit test each of the functions
11. Keep functions limited to 20 lines each
