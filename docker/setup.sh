docker-machine start default
docker-machine regenerate-certs default
docker-machine env default
eval $(docker-machine env default)