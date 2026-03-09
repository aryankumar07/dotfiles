tc () {
  tmux new -s $1
}


ta () {
  tmux attach -t $1
}

tk () {
  tmux kill-session -t $1
}
