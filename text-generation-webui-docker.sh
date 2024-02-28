docker run -d --name textgen atinoda/text-generation-webui:latest
docker exec -it textgen bash

pip3 uninstall torch torchvision torchaudio -y 
pip3 install torch==2.1.* torchvision==0.16.* torchaudio==2.1.* --index-url https://download.pytorch.org/whl/cu118
pip3 install hqq
cp requirements.txt requirements.txt.BACKUP
sed -i 's@cu121@cu118@g' requirements.txt
sed -i 's@cu122@cu118@g' requirements.txt
pip install -r requirements.txt -U

> import torch
> torch.version.cuda

# fix ~/pyvenv.cfg:/venv/pyvenv.cfg
-> include-system-site-packages = true


docker commit textgen c00cjz00/c00cjz00_cuda11.8_text-generation-webui:snapshot-2024-02-25

docker push c00cjz00/c00cjz00_cuda11.8_text-generation-webui:snapshot-2024-02-25


### cuda version
docker run --name demo -d  c00cjz00/c00cjz00_cuda11.8_pytorch:2.1.2-cuda11.8-cudnn8-runtime
docker exec -it demo bash


BRANCH="snapshot-2023-12-10"
REPOSRC=https://github.com/oobabooga/text-generation-webui.git
LOCALREP=/app
git clone --branch $BRANCH $REPOSRC $LOCALREP
cd $LOCALREP
cp requirements.txt requirements.txt.BACKUP
sed -i 's@cu121@cu118@g' requirements.txt
sed -i 's@cu122@cu118@g' requirements.txt

pip install -r requirements.txt -U
pip install -r extensions/openai/requirements.txt -U

pip install hqq 


docker commit demo  c00cjz00/c00cjz00_cuda11.8_text-generation-webui:snapshot-2023-12-10

