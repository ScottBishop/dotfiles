
alias dco='docker-compose'
alias dcob='docker-compose build'
alias dcou='docker-compose up'
alias dcrm='docker-compose-rm'
alias dcol="docker-compose logs -f --tail 100"

# restart services in docker-compose
docker-compose-rm(){
	docker-compose stop $@
	docker-compose rm -f -v $@
}

dexec () {
  docker exec -it "$1" "${2:-bash}"
}