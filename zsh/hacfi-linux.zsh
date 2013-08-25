alias myip='curl -s ip.appspot.com'

alias hosts='sudo vim /etc/hosts'

alias phpconf='cd /etc/php'

alias phpstart='sudo service php5-fpm start && sudo service php5-fpm status'
alias phpstop='sudo service php5-fpm stop && sudo service php5-fpm status'
alias phprestart='sudo service php5-fpm restart && sudo service php5-fpm status'
alias phpreload='sudo service php5-fpm reload && sudo service php5-fpm status'

alias nginxconf='cd /etc/nginx'
alias nginxt='sudo nginx -t'
alias nginxsites='cd /etc/nginx/sites-enabled'
alias nginxreload='sudo service nginx reload && sudo service nginx status'
alias nginxstop='sudo service nginx stop && sudo service nginx status'
alias nginxrestart='sudo service nginx restart && sudo service nginx status'
alias nginxstart='sudo service nginx start && sudo service nginx status'

alias randpass="openssl rand -base64 8"

