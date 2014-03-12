FROM ubuntu

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install memcached
RUN apt-get install -y memcached

# run as user daemon (memcached doesn't allow to run as root)
USER daemon

# expose memcached port
EXPOSE 11211

# Launch memcached when launching the container
# CMD [ "memcached" ]
ENTRYPOINT [ "memcached" ]
