# ann_siamese

This is work under construction.
Some snippets from possibly useful exercises for learning Deep Learning.
See file ann4brains/examples/ann_siamese: layer filters are varied to demonstrate overfitting.
Change the number of filters in e2n and e2e layers until you see CNN overfit data.

Instructions to run and install this code are given at the bottom.

If you wish to know more about ann4brains(Artificial Neural Networks For Brain), please read on or refer to original paper
by Kawahara et. al.

# ann4brains

ann4brains implements filters for **adjacency matrices**, representing networks, that can be used within a deep neural network. These filters are designed specifically for brain networks (i.e. connectomes), but can be used with adjacency matrices representing networks of any kind. 

If your dataset is raw connectivity data (e.g., diffusion or functional MRI volumes), you will need to first extract brain networks (i.e., 2D adjacency matrices) from this data using other software (e.g., the Connectome Computation System, https://github.com/zuoxinian/CCS or the HCP Connectome Toolbox, http://www.humanconnectome.org/software/)

ann4brains is a Python wrapper for [Caffe](https://github.com/BVLC/caffe) that implements the Edge-to-Edge, and Edge-to-Node filters as described in:

> Kawahara, J., Brown, C. J., Miller, S. P., Booth, B. G., Chau, V., Grunau, R. E., Zwicker, J. G., and Hamarneh, G. (2017). BrainNetCNN: Convolutional neural networks for brain networks; towards predicting neurodevelopment. NeuroImage, 146(July), 1038–1049. [[DOI]](https://doi.org/10.1016/j.neuroimage.2016.09.046) [[URL]](http://brainnetcnn.cs.sfu.ca/) [[PDF]](http://www.cs.sfu.ca/~hamarneh/ecopy/neuroimage2016.pdf)

------------------

------------------

## Installation

ann4brains uses the following dependencies:

- numpy
- scipy
- h5py
- matplotlib
- cPickle
- [Caffe](https://github.com/BVLC/caffe)

*You must already have [Caffe](https://github.com/BVLC/caffe) and pycaffe working on your system*

i.e., in Python, you should be able to run,
```python
import caffe
```
without errors.

[comment]: # (To install ann4brains, download it, cd to the ann4brains root folder, and then run the install command:)

To use ann4brains, download it, and try to run the [helloworld](https://github.com/jeremykawahara/ann4brains/blob/master/examples/helloworld.py) example:

```
git clone https://github.com/jeremykawahara/ann4brains.git
cd ann4brains/examples
python helloworld.py
```

This example will create synthetic data, train a small neural network, and should output the correlation of:
```
('Correlation:', 0.61187756)
```

More examples are in this [extended notebook](https://github.com/jeremykawahara/ann4brains/blob/master/examples/brainnetcnn.ipynb).

[comment]: # (python setup.py install --user)

------------------

## Working directly with Caffe

If you prefer to work directly with [Caffe](https://github.com/BVLC/caffe) and not use this wrapper, you can modify the [example prototxt files](https://github.com/jeremykawahara/ann4brains/tree/master/examples/proto) that implement the E2E and E2N filters. Or view the [Python files](https://github.com/jeremykawahara/ann4brains/blob/master/ann4brains/layers.py) that generate the E2E and E2N layers.

------------------
## What are these filters?
I wrote a [short blog post informally describing these filters](https://kawahara.ca/convolutional-neural-networks-for-adjacency-matrices/) and this work, which you may find helpful. But here are the key ideas (in the form of a gif):
### Edge-to-Edge
![edge to edge filter](https://i2.wp.com/kawahara.ca/wp-content/uploads/edge-to-edge-filter.gif?w=600 "Edge-to-Edge")

(Left) The input. (Yellow cross) the filter. (Right) The output response.

The Edge-to-Edge filter computes a weighted response over neighbouring edges for a given edge.

### Edge-to-Node
![edge to node filter](https://i0.wp.com/kawahara.ca/wp-content/uploads/edge-to-node-filter.gif?w=600 "Edge to Node")

(Left) The input. (Yellow cross) the filter. (Right) The output response.

The Edge-to-Node filter computes a weighted response over neighbouring edges for a given node.
