FROM python:3.9.7-slim-buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git curl python3-pip ffmpeg
RUN pip3 install -U pip
RUN python3 -m pip install --upgrade pip

# Install dependencies for pycairo
RUN apt-get install -y pkg-config libcairo2-dev

COPY . /app/
WORKDIR /app/
RUN pip3 install -U -r requirements.txt
CMD ["bash", "start.sh"]
