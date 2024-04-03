# docker run -d --name llama-factory c00cjz00/c00cjz00_cuda11.8_pytorch:2.1.2-cuda11.8-cudnn8-devel

cd /workspace
git clone https://github.com/hiyouga/LLaMA-Factory.git
pip install -r LLaMA-Factory/requirements.txt
pip install -e .[deepspeed,metrics,bitsandbytes,qwen]
git clone https://github.com/ggerganov/llama.cpp.git
pip install -r llama.cpp/requirements.txt

