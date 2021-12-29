FROM centos:7
RUN yum -y install perl perl-CPAN perl-Digest-MD5 gcc make cpanminus
RUN cpanm Crypt::Blowfish
RUN cpan Crypt::CBCeasy
RUN curl -L -O https://cpan.metacpan.org/authors/id/L/LD/LDS/Crypt-CBC-2.15.tar.gz
RUN tar -xzvf Crypt-CBC-2.15.tar.gz
RUN cd Crypt-CBC-2.15 && perl Makefile.PL INSTALL_BASE=/tmp/localperl && make install
COPY decrypt.pl /usr/local/bin/decrypt
COPY encrypt.pl /usr/local/bin/encrypt
RUN chmod 755 /usr/local/bin/{decrypt,encrypt}


# To use
# docker build -t enctool .
# docker run -ti enctool /bin/bash
# decrypt '<key>' '<ciphertext>'
# encrypt '<key>' '<plaintext>'
