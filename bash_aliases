### Clear
alias c="clear"
alias cll="c;ll"

### chmod
alias chr="chmod 644"
alias chx="chmod 755"

### Facter as YAML
alias facter="facter -y"

### History
alias che="clear;history -c;exit"
alias hgrep="history|grep -E"

### IP
alias ipe="curl ipinfo.io/ip"

### MySQL
alias mysql="mysql -u caseyadmin -p"
alias mysql-pt="mysql -D primetrust -u caseyadmin -p"
alias mysql-banq="mysql -D banq -u caseyadmin -p"

### Python 3
alias va="source ./venv/bin/activate"
alias ve="python -m venv ./venv"
alias www="python -m http.server 8000"

### rm
alias rm="safe-rm"
alias rmf="rm -rf"

### Sensors
alias cputemp="sensors | grep Core"

### Source
alias src="source ~/.profile"

### Speed test
alias speed="speedtest-cli --server 2406 --simple"

### SSH
alias egnyte="ssh caseyadmin@egnyte"
alias elk="ssh caseyadmin@elk"
alias pbx="ssh caseyadmin@pbx"
alias wbp="ssh caseyadmin@wallboardpi"
alias wiki="ssh caseyadmin@wiki"

### Sudo
alias sudo="sudo -E"

