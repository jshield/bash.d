# pacman functions
pacsearch () 
{
  echo -e "$(pacman -Ss $@ | sed \
  -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
  -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
  -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
  -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}