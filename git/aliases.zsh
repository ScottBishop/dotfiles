# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -am'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gw='./gradlew --offline'

alias git=hub
alias gitoneline="git log --graph --decorate --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitonelineall="git log --graph --decorate --all --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitpretty="git log --graph --decorate --name-status"
alias gitprettyall="git log --graph --decorate --name-status --all"
alias gitreset="git reset HEAD\^" # convenience function to go back one commit
alias gitpush="git push origin HEAD"
alias gitwip="git commit -a -m 'WIP DO NOT COMMIT'"

function gitmergecommit() { git log $1..HEAD --ancestry-path --merges }
function gitmerged() { git branch --merged $@ | sed -e '/^*/d' }
function gitcleanup() { git branch -d $(gitmerged); git remote prune origin }
function gitshowsvn() { git show `git svn find-rev r$1` }
function gitsvnrebase() {
	if [[ $1 != "-l" ]]; then
		git svn fetch;
	fi
	git for-each-ref --shell --format='git co %(refname:short); git svn rebase -l;' refs/heads | \
		while read entry
		do
			eval "$entry"
		done
}