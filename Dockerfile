FROM python:3.8-slim-buster
COPY requirements.txt requirements.txt
RUN apt-get update
RUN apt-get install -y libssl-dev aria2 ffmpeg curl unzip
RUN curl https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-640.x86_64-unknown-linux.zip --output Bento4-SDK-1-6-0-640.x86_64-unknown-linux.zip
RUN unzip Bento4-SDK-1-6-0-640.x86_64-unknown-linux.zip
RUN mkdir -p bin
RUN mv Bento4-SDK-1-6-0-640.x86_64-unknown-linux/bin/* ./bin/
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
COPY . .
CMD ["python3", "main.py"]