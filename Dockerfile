
FROM ubuntu:latest


ARG DEBIAN_FRONTEND=noninteractive
ARG RUN_SCRIPT=run_program.py

ENV TZ=America/Montreal

RUN apt-get update && \
    apt-get install -y apt-transport-https 

RUN apt-get install -y git wget curl zip build-essential cmake sysvbanner gcc g++ gfortran make
RUN apt-get install -y python2 python-dev python-setuptools cython
RUN apt-get install -y \
    libcanberra-gtk-module \
    libcanberra-gtk3-module 

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    python get-pip.py
RUN pip install --upgrade numpy scipy && pip install scikit-image

RUN apt install -y gimp python-cairo python-gobject-2
RUN curl https://www.gimp-forum.net/attachment.php?aid=5465 --output gimp-dep.zip && \
    unzip gimp-dep.zip && \
    dpkg -i ./python-gtk2_2.24.0-6_amd64.deb && \
    dpkg -i ./gimp-python_2.10.8-2_amd64.deb

RUN git clone https://github.com/parham/gimp-labeling-docker && \
    mkdir -p /root/.config/GIMP/2.10/plug-ins/ && \
    chmod ugo+x gimp-labeling-docker/gimp/label-toolbox.py

RUN cp ./gimp-labeling-docker/gimp/* /usr/lib/gimp/2.0/plug-ins/

ENTRYPOINT [ "gimp" ]