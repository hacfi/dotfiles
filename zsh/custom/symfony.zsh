function sfroot() {
  dir=${PWD%/$1/*}/$1
  while [[ $PWD != '/' && ! -f composer.json ]]; do cd ..; done
  if [ $PWD = '/' ]; then
    cd "$dir";
  fi
}
alias sfroot.='.. && sfroot'

function sfpermission() {
  chmod 0777 */cache */logs
}

alias phpcsfixer='php -n -d short_open_tag=off vendor/bin/php-cs-fixer fix --diff --dry-run'
alias ccr='vendor/bin/codecept run'
alias cll='rm */logs/*.log'
alias sfcl='rm -rf */cache/*'
alias sfdc='sf doctrine:database:create'
alias sfdd='sf doctrine:database:drop'
alias sfsc='sf doctrine:schema:create'
alias sfsd='sf doctrine:schema:drop --full-database --force'
alias sfsu='sf doctrine:schema:update --dump-sql --force'
alias sfge='sf doctrine:generate:entity'
alias sfges='sf doctrine:generate:entities'
alias sfgb='sf generate:bundle'
alias sfcrud='sf doctrine:generate:crud'
alias sfform='sf doctrine:generate:form'
alias sfsr='sf server:run'
alias sfr='sf debug:router -e=prod'
alias sfrd='sf debug:router -e=dev'
alias sfgesnb='sf doctrine:generate:entities --no-backup'
alias sfbb='php ./vendor/sensio/distribution-bundle/Sensio/Bundle/DistributionBundle/Resources/bin/build_bootstrap.php $(pwd)/var $(pwd)/app 1'
# alias sfbb='php ./vendor/sensio/distribution-bundle/Sensio/Bundle/DistributionBundle/Resources/bin/build_bootstrap.php 0 0 1'

#alias twigcache='grep -r "^/\*.\@.*\/.*.\*\/$" */cache/dev/twig'
alias twigcache="find */cache/dev/twig -type f  -exec sh -c 'echo {} && head -n 3 {} | tail -n 1 && echo' \;"
