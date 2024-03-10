REGISTRY=registry-public.deploys.app

build:
	buildctl build \
        --frontend dockerfile.v0 \
        --local dockerfile=. \
        --local context=. \
        --output type=image,name=$(REGISTRY)/builder,push=true
