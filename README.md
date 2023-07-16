# Neural Network Designer

The Neural Network Designer is an application for building deep neural networks using a grammatical evolution framework.

This application allows the user to choose between 4 image classification datasets for the training of the deep neural network model. The datasets are:

- [CIFAR-10](https://www.tensorflow.org/datasets/catalog/cifar10?hl=pt-br)
- [MNIST](https://www.tensorflow.org/datasets/catalog/mnist?hl=pt-br)
- [KMNIST](https://www.tensorflow.org/datasets/catalog/kmnist?hl=pt-br)
- [EUROSAT](https://www.tensorflow.org/datasets/catalog/eurosat?hl=pt-br)  

The first step is to click start, then choose the dataset. The next step is to build the grammar that will be used to design the models to be evaluated, the grammar must contain a Conv Poll Layer (CONV_POLL) and a Fully Connected Layer (FC). After that, the user will select the parameters for each layer. 

At the end of the process, the user will be able to review the dataset selected and the grammar that was build before running the model. With the results in hand, it's possible to save the model. All saved models can be acessed through the history, in the home page. 