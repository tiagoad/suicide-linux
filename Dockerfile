FROM debian:bullseye

COPY bash.bashrc /etc/

ENTRYPOINT ["bash"]
