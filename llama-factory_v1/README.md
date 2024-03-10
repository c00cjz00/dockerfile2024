# cjz update
```
sudo vi /etc/apt/sources.list
1
添加高版本的源
deb http://th.archive.ubuntu.com/ubuntu jammy main    #添加该行到文件
1
运行升级
sudo apt update
sudo apt install libc6
1
2
查看结果

strings /lib/x86_64-linux-gnu/libc.so.6 |grep GLIBC_
```

# cjz docker
```
chmod -R 755 context/
docker build -t c00cjz00/pytorch:2.1.2-cuda11.8-cudnn8-devel .
docker push
```
# cjz singularity 
```
singularity pull docker://c00cjz00/cuda:11.8.0-cudnn8-devel-ubuntu22.04
```

# apt
apt install libfontconfig  libaio-dev  libibverbs-dev jq

# pip
pip install llmtuner==0.5.3 deepspeed==0.13.1  bitsandbytes==0.42.0 opencc opencc-python-reimplemented
