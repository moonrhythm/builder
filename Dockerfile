FROM debian:bookworm-20240211-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
	apt-get install -y \
		curl \
		git \
		dirmngr \
		gpg \
		gawk \
		unzip \
		&& \
	apt-get clean
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 --depth=1

ENV PATH="$PATH:/root/.asdf/bin:/root/.asdf/shims"

RUN asdf plugin add golang && \
	asdf plugin add nodejs && \
	asdf plugin add hugo https://github.com/nklmilojevic/asdf-hugo.git && \
	asdf plugin add bun && \
	asdf plugin add rust && \
	asdf plugin add zig && \
	asdf plugin add pnpm
