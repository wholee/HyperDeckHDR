current_dir = $(shell pwd)
container_name = hyperhdr-builder
# temp_container = hyperhdr-temp

.PHONY: all rebuild clean

# Build HyperHDR and copy output
all: clean
	docker build --no-cache -t $(container_name) .
	mkdir -p $(current_dir)/out
	docker run --rm -v $(current_dir)/out:/workspace/out $(container_name) true

# Rebuild image from scratch
rebuild:
	docker rmi $(container_name) || true
	make all

# Clean output folder
clean:
	rm -rf out/*