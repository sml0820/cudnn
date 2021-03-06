sudo apt-get update && sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
sudo modprobe nvidia
nvidia-smi

mkdir downloads
cd downloads
wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
bash Anaconda2-4.2.0-Linux-x86_64.sh -b
echo 'export PATH="/usr/local/cuda/bin:$HOME/anaconda2/bin:$PATH"' >> ~/.bashrc
export PATH="/usr/local/cuda/bin:$HOME/anaconda2/bin:$PATH"
conda install -y bcolz
conda upgrade -y --all

pip install theano
echo "[global]
device = gpu
floatX = float32" > ~/.theanorc

pip install keras
mkdir ~/.keras
echo '{
    "image_dim_ordering": "th",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "theano"
}' > ~/.keras/keras.json

wget https://github.com/sml0820/cudnn/blob/master/cudnn.tgz?raw=true
tar -zxf cudnn.tgz?raw=true
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

