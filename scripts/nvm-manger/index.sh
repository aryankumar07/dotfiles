swn() {
  unset -f nvm
  export PATH="/usr/local/bin:$(echo $PATH | tr ':' '\n' | grep -v '.nvm' | tr '\n' ':')"
  hash -r
  which node
  node -v
}
