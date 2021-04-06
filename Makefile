help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

start: ## build the image and run it interactively
	docker build -t woosh . ; docker run --rm -it woosh

lint: ## run shellcheck as entrypoint
	docker build -t woosh . ; docker run --rm --entrypoint "/bin/shellcheck" woosh **/*.sh

.PHONY: help