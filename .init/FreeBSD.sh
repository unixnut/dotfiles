for file in .init/setup.BSD.d/*.sh ; do
  . $file
done

export OS_BASE=BSD
