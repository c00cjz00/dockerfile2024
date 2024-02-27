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

docker commit textgen c00cjz00/c00cjz00_cuda11.8_text-generation-webui:snapshot-2024-02-25

docker push c00cjz00/c00cjz00_cuda11.8_text-generation-webui:snapshot-2024-02-25
