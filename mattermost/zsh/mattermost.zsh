# mm-redux variable
export WEBAPP_DIR=$GOPATH/src/github.com/mattermost/mattermost-webapp/

alias mmmd='make deploy'
alias mmmsd='make server-debug'
alias mmmwd='make webapp-debug'
alias mmdevdocs='cd $HOME/Sites/mattermost-developer-documentation' # edit docs @ developers.mattermost.com/ 

mm_dir="$HOME/go/src/github.com/mattermost"
alias mm='cd $mm_dir'
alias mmdocs='cd $mm_dir/docs' # edit docs @ docs.mattermost.com/ 
alias mmdevtools='cd $mm_dir/dev-tools-documentation' # edit docs @ developers.mattermost.com/ 
alias mme='cd $mm_dir/enterprise'
alias mmm='cd $mm_dir/mattermost-mobile'
alias mmj='cd $mm_dir/mattermost-plugin-jira'
alias mmb='cd $mm_dir/mattermost-plugin-bitbucket'
alias mmg='cd $mm_dir/mattermost-plugin-github'
alias mmz='cd $mm_dir/mattermost-plugin-zoom'
alias mmr='cd $mm_dir/mattermost-redux'
alias mms='cd $mm_dir/mattermost-server'
alias mmw='cd $mm_dir/mattermost-webapp'

alias mmsql='mysql --host=dockerhost --user=mmuser --password=mostest mattermost_test'
alias mm_ngrok="ngrok http 8065 -subdomain=$NGROK_SUBDOMAIN" 

mm_user() {
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user create --email $1@example.com --username $1 --password password1
}

mm_userbot() {
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user create --email $1@example.com --username $1 --password password1
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user convert $1 --bot
}

mm_usersysadmin() {
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user create --email $1@example.com --username $1 --password password1 --sysadmin
}

mm_bot2user() {
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user convert $1 --email $1@example.com --username $1 --password password1 --user
}

mm_user2bot() {
    go run ${mm_dir}/mattermost-server/cmd/mattermost/main.go user convert $1 --bot
}
