FROM golang:1.26.3-bookworm

RUN go install github.com/asdf-vm/asdf/cmd/asdf@v0.19.0

FROM debian:12.9-slim

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

COPY --from=0 /go/bin/asdf /root/.asdf/bin/asdf

ENV PATH="$PATH:/root/.asdf/bin:/root/.asdf/shims"

RUN asdf plugin add golang && \
	asdf plugin add nodejs && \
	asdf plugin add hugo https://github.com/nklmilojevic/asdf-hugo.git && \
	asdf plugin add bun && \
	asdf plugin add rust && \
	asdf plugin add zig && \
	asdf plugin add pnpm && \
	asdf plugin add python
