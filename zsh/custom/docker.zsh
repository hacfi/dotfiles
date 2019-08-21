alias dang='docker rmi $(docker images -q -f dangling=true)'
alias db='docker build'
alias dcp='docker cp'
alias de='docker events'
alias dex='docker exec'
alias dhis='docker history'
alias di='docker images'
alias dim='docker import'
alias dinf='docker info'
alias dins='docker inspect'
alias dk='docker kill'
alias dka='docker kill $(dpa -q)'
alias dlog='docker logs'
alias dp='docker ps'
alias dpq='docker ps -q'
alias dpa='docker ps -a'
alias dpaq='docker ps -aq'
alias dpu='docker pull'
alias dr='docker run'
alias dri='docker run -it'
alias drirm='docker run -it --rm'
alias drd='docker run -d'
alias drm='docker rm -v'
alias drma='docker rm -v $(dpa -q)'
alias drmi='docker rmi'
alias ds='docker start'
alias dst='docker stop'
alias dsta='docker stop $(dpa -q)'
alias dt='docker tag'

alias dca='/usr/bin/dc'
alias dc='docker-compose'
alias dco='docker-compose'
