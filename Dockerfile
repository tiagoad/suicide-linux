FROM debian:stretch

COPY bash.bashrc /etc/

ENTRYPOINT ["bash"]
