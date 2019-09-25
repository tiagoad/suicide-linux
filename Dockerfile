FROM debian:buster

COPY bash.bashrc /etc/

ENTRYPOINT ["bash"]
