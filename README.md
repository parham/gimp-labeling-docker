<a href="https://www.ulaval.ca/en/" target="_blank">
    <img src="https://ssc.ca/sites/default/files/logo-ulaval-reseaux-sociaux.jpg" alt="Logo" width="280" height="100">
</a>

Docker for GIMP Image Labeling Toolbox
===========================

Image labeling is a common task in computer vision where humans are used to generate a ground truth data set to act both as training data for computer vision algorithms and testing benchmarks for methods that perform semantic segmentation algorithms. The label here is an assignment of a value (or possibly multiple values) to each pixel in the image. These values are usually integers which map to semantic categories such as "train" and "person". Since labels are assigned to each pixel the task is inherently a *painting* task. It then makes sense to use a painting program to perform hand labeling. This toolbox seeks to facilitate this by working with [the GNU Image Manipulation Program (GIMP)](http://www.gimp.org/) [[1]](https://github.com/vietjtnguyen/gimp-image-labeling-toolbox)

This docker image uses the original implementation of [GIMP Image Labeling Toolbox](https://github.com/vietjtnguyen/gimp-image-labeling-toolbox)

## Dependencies

* Docker

## Pull from Docker

The docker image can be directly pulled from the DockerHub repo.

```
docker pull phm66/gimp-labeling-toolbox
```

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

## Contact
Parham Nooralishahi - [first name].[last name]@gmail.com | [@phm](https://www.linkedin.com/in/parham-nooralishahi/) <br/>
