FROM phusion/baseimage:0.11 as builder
LABEL maintainer="richard@creatorchain.network"
LABEL description="This is the build stage for Creatorchain. Here we create the binary."

ARG PROFILE=release
WORKDIR /creatorchain

COPY . /creatorchain

RUN apt-get update && \
	apt-get dist-upgrade -y -o Dpkg::Options::="--force-confold" && \
	apt-get install -y cmake pkg-config libssl-dev git clang

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
	export PATH="$PATH:$HOME/.cargo/bin" && \
	rustup install nightly-2021-06-01 && \
	rustup target add wasm32-unknown-unknown --toolchain nightly-2021-06-01 && \
	cargo +nightly-2021-06-01 build "--$PROFILE"

# ===== SECOND STAGE ======

FROM phusion/baseimage:0.11
LABEL maintainer="richard@creatorchain.network"
LABEL description="This is the 2nd stage: a very small image where we copy the Creatorchain binary."
ARG PROFILE=release

RUN mv /usr/share/ca* /tmp && \
	rm -rf /usr/share/*  && \
	mv /tmp/ca-certificates /usr/share/ && \
	useradd -m -u 1000 -U -s /bin/sh -d /creatorchain creatorchain && \
	mkdir -p /creatorchain/.local/share/creatorchain && \
	chown -R creatorchain:creatorchain /creatorchain/.local && \
	ln -s /root/.local/share/creatorchain /data

COPY --from=builder /creatorchain/target/$PROFILE/creatorchain /usr/local/bin
#COPY --from=builder /creatorchain/target/$PROFILE/subkey /usr/local/bin
#COPY --from=builder /creatorchain/target/$PROFILE/node-rpc-client /usr/local/bin
#COPY --from=builder /creatorchain/target/$PROFILE/node-template /usr/local/bin
#COPY --from=builder /creatorchain/target/$PROFILE/chain-spec-builder /usr/local/bin

# checks
RUN ldd /usr/local/bin/creatorchain && \
	/usr/local/bin/creatorchain --version

# Shrinking
RUN rm -rf /usr/lib/python* && \
	rm -rf /usr/bin /usr/sbin /usr/share/man

USER creatorchain
EXPOSE 30333 9933 9944 9615
VOLUME ["/data"]

CMD ["sh", "-c", "/usr/local/bin/creatorchain"]
