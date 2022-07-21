for i in {1..100}; do
  echo 羊が${i}匹
  sleep 1
done

# if [ -f $1 ] ; then
#   cat $1
# else
#   touch $1 && cat $1
# fi

#if [ $# == 1 ]; then
#  echo $(($1 * 2))
#else
#  read line
#  echo $((line * 2))
#fi
