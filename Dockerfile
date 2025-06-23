FROM ubuntu:24.04

RUN apt update && apt install --no-install-recommends -y python3 python3-uvloop python3-crypttography python3-socks libcap2-bin ca-certificates && rm -rf /var/lib/apt/lists/*

RUN setcap cap_net_bind_service=+ep /usr/bin/python3.12

RUN useradd tgproxy -u 10000USER tgproxy

WORKDIR /home/tgproxy/COPY --chown=tgproxy mtprotoproxy.py config.py /home/tgproxy/

CMD ["python3", "mtprotoproxy.py"]
