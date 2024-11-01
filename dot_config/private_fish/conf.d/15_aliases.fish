# Generic aliases
abbr l 'ls -l'
abbr l1 'ls -1'
abbr lR 'ls -lR'
abbr la 'ls -a'
abbr laR 'ls -aR'
abbr lal 'ls -al'
abbr lh 'ls -lh'
abbr lalR 'ls -alR'
abbr lsd 'ls -l | grep "^d"'
abbr p 'ps aux'
abbr svim 'sudo -e'
abbr scat 'sudo cat'
abbr cast cat
abbr d 'df -h'
abbr h history
abbr rsync 'rsync --progress --stats'
abbr pign ping
abbr serve_cwd 'python -m SimpleHTTPServer'
abbr public-ip 'curl -s https://checkip.amazonaws.com/'
abbr urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
abbr j jobs
abbr p1 'ping 1.1.1.1'
abbr p8 'ping 8.8.8.8'
abbr vimdiff 'nvim -d'
abbr countdown 'mpg321 -q ~/iCloudDrive/Sounds/countdown.mp3'
abbr youtube-dl-mp3 'youtube-dl --extract-audio --audio-format mp3'
abbr weather 'clear; curl http://wttr.in/'
abbr tmux 'TERM screen-256color tmux'
abbr planetrock "mpg321 'http://tx.planetradio.co.uk/icecast.php?i planetrock.mp3'"
abbr da 'direnv allow'
abbr n 'navi --print'
abbr shrug 'echo -n "¯\\_(ツ)_/¯"'
abbr bandwhich 'sudo bandwhich'
abbr fzfp 'fzf --preview "bat --style=numbers --color always --line-range :500 {}" --border --height 50%'
abbr lg lazygit
abbr rgq 'rg --hidden --no-heading --no-line-number'
abbr t todo
abbr bu backup

abbr dotfiles "cd $HOME/iCloudDrive/Projects/dotfiles"
abbr downloads "cd $HOME/Downloads"
abbr icd "cd $HOME/iCloudDrive"
abbr p projects
abbr pass gopass

# Git
abbr gc 'git commit -m'
abbr gs 'git st'
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr gr 'git remote -v'
abbr gpom 'git push origin master'
abbr gdlc 'git diff-last-commit'
abbr gp 'git pull'
abbr gbt 'git branch-toggle'
abbr gnb 'git checkout -b'
abbr gco 'git checkout'
abbr gf 'git fetch'
abbr gpap 'git push-and-pr'
abbr gcomagp 'git checkout master && git pull'
abbr got git

# Docker
abbr dk docker
abbr dkb 'docker build'
abbr dki 'docker images'
abbr dkl 'docker login'
abbr dkp 'docker ps'
abbr dkr 'docker run'
abbr dkrm 'docker rm'
abbr dkrmi 'docker rmi'

# Terraform
abbr tf terraform
abbr tg terragrunt
abbr tg-cache-clear 'find . -name .terragrunt-cache | xargs -n1 rm -rf'

# Kubernetes
abbr k kubectl
abbr kl 'kubectl logs -f'
abbr ke 'kubectl get events -w'
abbr kpf 'kubectl port-forward'
abbr kg 'kubectl get'
abbr kd 'kubectl describe'
abbr kga 'kubectl get all'
abbr kgj 'kubectl get jobs'
abbr kgp 'kubectl get pods -L version,app'
abbr kgpw 'kubectl get pods -L version,app -o wide'
abbr kgd 'kubectl get deploy'
abbr kgdw 'kubectl get deploy -o wide'
abbr kgi 'kubectl get ing'
abbr kgn 'kubectl get nodes -L node.kubernetes.io/instance-type -L topology.kubernetes.io/region,topology.kubernetes.io/zone -L kubernetes.io/arch'
abbr kgnw 'kgn -o wide'
abbr kgns 'kubectl get namespaces'
abbr kgs 'kubectl get secrets'
abbr kges 'kubectl get externalsecrets'
abbr kgdp 'kubectl get deploy,pods'
abbr kgdps 'kubectl get deploy,pods,svc'
abbr kda 'kubectl describe all'
abbr kdj 'kubectl describe jobs'
abbr kdp 'kubectl describe pods'
abbr kdd 'kubectl describe deploy'
abbr kdi 'kubectl describe ing'
abbr kdn 'kubectl describe nodes'
abbr kds 'kubectl describe secrets'
abbr wkgp 'watch -n1 "kubectl get pods"'
abbr kdump 'kubectl get all --all-namespaces'
abbr ns kubens
abbr ctx kubectx
abbr kgc 'kubectl config get-contexts -o name | sort'

# Support aliases in these commands
abbr watch 'watch '

# AWS
abbr aws-account-id 'aws sts get-caller-identity | jq -r ".Account"'
abbr aws-account-alias 'aws iam list-account-aliases | jq -r ".AccountAliases[]"'
abbr aws-running-instances 'aws ec2 describe-instances --output=json --filters "Name=instance-state-name,Values running"'

if command --query bat
    abbr cat 'bat -p --decorations never'
    abbr batp 'bat -p --decorations never'
    abbr baty 'bat -l yaml'
    abbr batj 'bat -l json'
    abbr batf 'bat -l fish'
end

function showpath
    echo $PATH | tr ' ' '\n' | cat -n
end

function mkdircd
    mkdir -p $argv[1]
    cd $argv[1]
end

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function cdgr
    cd "$(git rev-parse --show-toplevel)" || true
end
