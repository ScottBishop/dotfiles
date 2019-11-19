# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Gradle
alias gw='./gradlew'

# Logging
alias gl='git log --first-parent'
alias glg='git log --graph'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Pushing
alias gp='git push origin HEAD'
function gpsu() { git push --set-upstream origin "$(git_branch)" }

# Pulling
alias gpl='git pull'
alias gsr='git svn rebase'

# Status
alias gd='git diff'
alias gs='git status'

# Committing
alias gc='git commit'
alias gca='git commit -a'
alias gaap='git commit -a --ammend --no-edit'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias ga='git add --all'

# Branching
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'

#Merging
alias gmd='git merge develop'
alias gpm='gitupdatebases;git merge develop'
alias ufb='updatefeaturebranch'

# Clean up
alias grp='git remote prune origin'
alias gcl='git-cleanup'
alias gclm='git branch | egrep -v "(master|\*)" | xargs git branch -D'
alias gclmaster='git branch | egrep -v "(master|\*)" | xargs git branch -D'

function change-commits-to-personal() {
	git filter-branch -f --env-filter "GIT_AUTHOR_NAME='ScottBishop'; GIT_AUTHOR_EMAIL='scottbishop70@gmail.com'; GIT_COMMITTER_NAME='scott.bishop'; GIT_COMMITTER_EMAIL='scott.bishop@servicenow.com';" HEAD
}

function change-commits-to-work() {
	git filter-branch -f --env-filter "GIT_AUTHOR_NAME='scott.bishop'; GIT_AUTHOR_EMAIL='scott.bishop@servicenow.com'; GIT_COMMITTER_NAME='ScottBishop'; GIT_COMMITTER_EMAIL='scottbishop70@gmail.com';" HEAD
}

function change-git-to-work() {
	git config user.name "scott.bishop" 
	git config user.email "scott.bishop@servicenow.com" 
}

function change-git-to-personal() {
	git config user.name "ScottBishop"
	git config user.email "scottbishop70@gmail.com" 
}

function gpsu() {
  git push --set-upstream origin "$(git_branch)"
}

function git_branch() {
  echo $($git symbolic-ref HEAD --short)
}

function git-merged() { git branch --merged $@ | sed -e '/^*/d' }

function git-cleanup() { 
	echo "=== Cleaning Remote Branch Caches ==="
	git remote prune origin

	echo "=== Cleaning Local Branches ========="
	except_branches=('"\*"' 'master' 'develop')
	command="git branch --merged"
	for branch in $except_branches; do
		command="$command | grep -v $branch"
	done
	command="$command | xargs -n 1 git branch -d"
	eval $command

    echo "=== Cleaning Local Branches With Empty Merges ==="
    command="git branch"
    for branch in $except_branches; do
        command="$command | grep -v $branch"
    done
    localBranches=(`eval $command`)
    for branch in $localBranches; do
        mergeBase=`git merge-base HEAD $branch`
        git merge-tree "$mergeBase" HEAD "$branch" | read
        if [ $? -ne 0 ]; then
            git branch -D $branch
        fi
    done
    
	echo "=== Remaining Branches =============="
	git branch
}

function gitupdatebases() {
    git fetch origin
    basis_branches=('master' 'develop')
    for branch in $basis_branches; do
        # verify it exists
        git show-ref --verify --quiet refs/heads/"$branch"
        if [ $? -ne 0 ]; then
            continue
        fi

        # verify it can be fast forwarded
        git merge-base --is-ancestor "$branch" origin/"$branch"
        if [ $? -ne 0 ]; then
            echo "$branch cannot be fast-forwarded to origin/$branch, you'll need to manually update your branch"
            continue
        fi

        # Change the branch ref to point to the new one
        echo "Updating $branch to origin/$branch"
        git update-ref refs/heads/"$branch" origin/"$branch"
    done
}

function updatefeaturebranch() {
    currentBranch=`git rev-parse --abbrev-ref HEAD`
    featureBranch="${1}"
    echo "=== Currently On Branch $currentBranch ==="
    echo "=== Updating All Base Branches Branches ==="
    gitupdatebases
    git checkout $featureBranch
    echo "=== Updating Feature Branch to origin/$featureBranch ==="
    git pull origin $featureBranch
    echo "=== Merging develop into $featureBranch ==="
    git merge develop
    echo "=== Pushing $featureBranch to Github ==="
    gp
    git checkout $currentBranch
    echo "=== Merging $featureBranch into $currentBranch ==="
    git merge $featureBranch
    echo "=== Successfully merged develop into $featureBranch and $featureBranch into $currentBranch ==="
}