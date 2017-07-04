FROM debian:jessie

COPY bash.bashrc /etc/

ENTRYPOINT ["bash"]
