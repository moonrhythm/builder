REGISTRY=asia-southeast3-docker.pkg.dev/moonrhythm-core/public

build:
	buildctl build \
        --frontend dockerfile.v0 \
        --local dockerfile=. \
        --local context=. \
        --output type=image,name=$(REGISTRY)/builder,push=true
