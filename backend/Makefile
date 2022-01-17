docker:
	docker build -t led_backend -f Dockerfile .
build-run: build run

docker-run:
	docker run --rm -p 15000:5000 --name led_backend --network="bridge" led_backend 

docker-build-run: docker docker-run