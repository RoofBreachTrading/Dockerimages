FROM ubuntu

# Install dependencies from repository
RUN apt update && apt install -y wget build-essential autoconf libtool pkg-config libboost-all-dev libssl-dev libevent-dev libsodium-dev libminiupnpc-dev unzip && apt autoremove && apt clean

# TODO: Add AWS CloudWatch daemon

# Install missing outdated version of libdb
RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && tar xzvf db-4.8.30.NC.tar.gz && cd db-4.8.30.NC/build_unix/ && ../dist/configure --enable-cxx && make && make install && cd /usr/lib && ln -s /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so libdb_cxx-4.8.so
