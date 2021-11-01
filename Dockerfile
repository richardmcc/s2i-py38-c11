FROM nvidia/cuda:11.4.2-cudnn8-runtime-ubuntu20.04
RUN apt-get update \
 && apt-get install -y wget \
 && apt-get install -y python3.8 \
 && ln -s /usr/bin/python3.8 /usr/local/bin/python \
 && wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh \
 && bash Miniconda3-py38_4.9.2-Linux-x86_64.sh -b \
 && export PATH=/root/miniconda3/bin/:$PATH \
 && echo "export PATH=/root/miniconda3/bin/:$PATH" >> /root/.bashrc \
 && conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch \
 && conda install -y pandas \
 && conda install -y scikit-learn \
 && conda install -y matplotlib \
 && conda install -y -c conda-forge jupyterlab 

CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]


