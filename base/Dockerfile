FROM ubuntu

# Create unprivileged user
RUN groupadd -r rbt && useradd --no-log-init -r -g rbt rbt

# Install dependencies
RUN apt update && apt install -y --no-install-recommends \
        # Used for log push
        awscli \
        cron \
        # Used for compiling libs
        build-essential \
        # To be declared
        autoconf \
        libboost-all-dev \
        libevent-dev \
        libminiupnpc-dev \
        libsodium-dev \
        libssl-dev \
        libtool \
        pkg-config \
        unzip \
        # Used to get the library
        wget && \
    # Install missing outdated version of libdb
    wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && \
    tar -xzvf db-4.8.30.NC.tar.gz && \
    cd db-4.8.30.NC/build_unix/ && \
    ../dist/configure --enable-cxx && \
    make && \
    make install && \
    ln -s /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so /usr/lib/libdb_cxx-4.8.so && \
    cd / && rm -R db-4.8.30.NC* && \
    # Cleanup
    apt purge -y \
        build-essential \
	wget && \
    rm -rf /var/lib/apt/lists/*

# Switch to unprivileged user
# This seems to fuck up permissions for now (maybe only on when creating the image on windows)
USER rbt:
#WORKDIR ~

# Add AWS CloudWatch job
COPY logpush_base.sh /home/rbt/
RUN (crontab -l ; echo "* * * * * ~/logpush_base.sh") | crontab -
USER root
