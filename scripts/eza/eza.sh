lss () {
  if [[ "$1" == "-l" ]]
  then
    eza --no-filesize --long --color=always --icons=always --no-user 
  else
    eza --no-filesize --grid --color=always --icons=always --no-user 
  fi
}
