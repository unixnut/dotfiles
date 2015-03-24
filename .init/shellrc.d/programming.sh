# Compile to a binary in ~/bin/$BINARY_TYPE/ named after source file.
# Usage: compile <source> [ <options> ... ]
compile()
{
  local basename=${1##*/}

  gcc -O -I$HOME/src/legacy/include \
      -Wuninitialized -Wimplicit -Wformat -Wcomment -Wswitch -Wwrite-strings \
      -o ~/bin/$BINARY_TYPE/"${basename%.*}" "$@"
}


# Compile to an object file in ~/Projects/lib/$BINARY_TYPE named after source file.
# Uses the source file's location as an include path.  (But not my central include dir.)
# Usage: ocompile <source> [ <options> ... ]
ocompile()
{
  local basename=${1##*/}

  gcc -O -I"${1%/*}" \
      -Wuninitialized -Wimplicit -Wformat -Wcomment -Wswitch -Wwrite-strings \
      -o ~/Projects/lib/$BINARY_TYPE/"${basename%.*}.o" "$@"
}


# Compile to a class file in ~/bin/Classes
alias jcompile='javac -deprecation -d ~/bin/Classes'
