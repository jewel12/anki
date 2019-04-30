.PHONY: run docker/run docker/build

DOCKER_IMAGE := anki
ANKI_DATA_DIR :=

run:
	@QTWEBENGINE_DISABLE_SANDBOX=1 DEBUG=1 ./runanki --platform offscreen

docker/run:
	@docker run -p 8765:8765 -v $(ANKI_DATA_DIR):/root/.local/share/Anki2 -it $(DOCKER_IMAGE)

docker/build:
	docker build . -t $(DOCKER_IMAGE)
