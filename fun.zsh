
function dcleanup() {
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

function jose::fast_git() {
    color=""
    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2> /dev/null; then
        branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
        branch_name=""     # detached HEAD
        if [ -z $branch_name ]; then
            branch_name="$(git rev-parse HEAD)"
        else
            branch_name=${branch_name##refs/heads/}
        fi
        state="$(git diff --stat)"
        diff=""
        if [ -n "$state" ]; then
            diff="%F{red}+%f"
        fi
        echo "$branch_name $diff"
    fi
}
