FROM ubuntu as BASE
MAINTAINER YGVKN
LABEL YGVKN ZHUZHA
WORKDIR /.github
RUN set -eux; \
    apt update && apt install curl -yqq --no-install-recommends; \
    mkdir -p actions-runner \
    && cd actions-runner \
    && curl -o actions-runner-linux-x64-2.283.2.tar.gz \
            -L https://github.com/actions/runner/releases/download/v2.283.2/actions-runner-linux-x64-2.283.2.tar.gz \
    && echo "ef2b350068f7d581eb6840e3c399a42f9cb808f7ee9a0456f3ad97c84ccb2a9d actions-runner-linux-x64-2.283.2.tar.gz" | shasum -a 256 -c \
    && tar xzf ./actions-runner-linux-x64-2.283.2.tar.gz \
    && rm -rf /var/lib/apt/lists/*
#HEALTHCHECK --interval=1m --timeout=13s CMD wget -qO-  0.0.0.0:4444 || true
STOPSIGNAL SIGTERM
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null","2>&1"]
## Create the runner and start the configuration experience
#$ ./config.sh --url https://github.com/YGVKN/YGVKN --token AE45JV7OLYEQ6IE5SVWI4PDBN247K# Last step, run it!
#$ ./run.sh
#Using your self-hosted runner
## Use this YAML in your workflow file for each job
#runs-on: self-hosted

