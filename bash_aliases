### Preferred sudo
alias csdo="sudo -E"

### SSH aliases
alias elk="ssh caseyadmin@elk"
alias pbx="ssh caseyadmin@pbx"
alias wbp="ssh caseyadmin@wallboardpi"
alias wiki="ssh caseyadmin@wiki"

### chmod aliases
alias chr="chmod 644"
alias chx="chmod 755"

### rm wrappers and shortcuts
alias rm="safe-rm"
alias rmf="rm -rf"

### Search history by regex
alias hgrep="history|grep -E"

### Sensors aliases
alias cputemp="sensors | grep Core"

### Facter as YAML
alias facter="facter -y"

### Start webserver in directory
alias www="python -m http.server 8000"

### Speed test
alias speed="speedtest-cli --server 2406 --simple"

### Get external IP
alias ipe="curl ipinfo.io/ip"

### Python environment
alias ve="python -m venv ./venv"
alias va="source ./venv/bin/activate"

### MySQL
alias mysql="mysql -u caseyadmin -p"
alias mysql-pt="mysql -D primetrust -u caseyadmin -p"
alias mysql-banq="mysql -D banq -u caseyadmin -p"

### Misc.
alias back="cd .."
alias c="clear"
