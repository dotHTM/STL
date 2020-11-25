FROM swift:bionic

RUN apt-get update
RUN apt-get install -y clang libicu-dev libcurl4-openssl-dev libssl-dev libpython2.7 

RUN apt-get install -y curl
RUN curl -fsSL https://github.com/Kitura/kitura-cli/releases/latest/download/install.sh | bash

ADD keep_alive.sh /
RUN chmod 555 /keep_alive.sh
CMD /keep_alive.sh

# CMD swift run