alias cdl='cd "`ls -dtr ./*/ | tail -n 1`"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias utc2int='python -c "import sys,time,dateutil.parser;print int(time.mktime(dateutil.parser.parse(sys.argv[1]).timetuple()))"'
alias int2utc='python -c "import sys,time;print time.asctime(time.gmtime(int(sys.argv[1])))+\" UTC\""'
#alias pandas='python -i <(echo "import sys,json;import pandas as pd;f=open(sys.argv[1]);jd=json.load(f);pdf=pd.DataFrame(jd);")'
alias pandas='python -i <(echo "import sys,json;import pandas as pd;pdf=pd.read_json(sys.argv[1]);")'

# Route to Docker Host. As alias doesn't allow to use sudo, using a function
function r2dh() {
    local _3rd_dec="${1:-100}"
    local _dh_ip="${2:-192.168.0.31}"
    sudo route delete -net 172.17.${_3rd_dec}.0/24 &>/dev/null
    sudo route add -net 172.17.${_3rd_dec}.0/24 ${_dh_ip}
}
