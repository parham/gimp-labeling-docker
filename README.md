Docker for GIMP Image Labeling Toolbox
===========================

Image labeling is a common task in computer vision where humans are used to generate a ground truth data set to act both as training data for computer vision algorithms and testing benchmarks for methods that perform semantic segmentation algorithms. The label here is an assignment of a value (or possibly multiple values) to each pixel in the image. These values are usually integers which map to semantic categories such as "train" and "person". Since labels are assigned to each pixel the task is inherently a *painting* task. It then makes sense to use a painting program to perform hand labeling. This toolbox seeks to facilitate this by working with [the GNU Image Manipulation Program (GIMP)](http://www.gimp.org/) thus providing access to the following features and more:

The docker uses the original implementation of [GIMP Image Labeling Toolbox](https://github.com/vietjtnguyen/gimp-image-labeling-toolbox)

## Dependencies

* Docker

## Execution

For executing the labeling toolbox, firstly you need to make the script executable,

```
chmod u+x run_docker.sh
```

Then, simply run the script,

```
./run_docker.sh
```
## Manual Docker Building
The Dockerfile can be built manually,
```
docker build --pull --rm -f "Dockerfile" -t gimp-labeler:latest "."
```
## Manual Docker Running
```
docker run --rm -it --init \
    --ipc=host --env="DISPLAY" \
    -v $HOME/.Xauthority:/root/.Xauthority \
    --volume="$PWD/data:/data" \
    --privileged --net=host  gimp-labeler:latest
```

## Acknowledgements
Thanks to **TORNGATS** for providing the required support for performing the experiment and requirement analysis.

## Contact
Parham Nooralishahi - parham.nooralishahi@gmail.com | [@phm](https://www.linkedin.com/in/parham-nooralishahi/) <br/>
