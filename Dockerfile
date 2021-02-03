FROM ubuntu:latest

WORKDIR /root

RUN apt update && apt install -y software-properties-common gnupg2
COPY . .

CMD [ "bash"]