lss() {
  local display=false
  local hidden=false

  while getopts ":la" opt
  do
    case $opt in
      l) display=true;;
      a) hidden=true;;
      \?) echo "Invalid option: -$OPTARG" >&2; return 1;;
    esac
  done

  shift $((OPTIND - 1))


  local cmd=("eza" "--color=always" "--icons=always" "--no-user" "--no-filesize")

  $display && cmd+=("--long") || cmd+=("--grid")
  $hidden && cmd+=("--all")

  cmd+=("$@")

  "${cmd[@]}"
}
