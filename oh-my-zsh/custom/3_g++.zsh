# g++
CPLUS_INCLUDE_PATH=$BREW_CELLAR/gcc/12.2.0/include/c++/12:$BREW_CELLAR/gcc/12.2.0/include/c++/12/aarch64-apple-darwin22:$BREW_CELLAR/gcc/12.2.0/include/c++/12/backward:$BREW_CELLAR/gcc/12.2.0/include/c++/12/aarch64-apple-darwin22/12/include:$BREW_CELLAR/gcc/12.2.0/include/c++/12/aarch64-apple-darwin22/12/include-fixed:/Library/Developer/CommandLineTools/SDKs/MacOSX13.sdk/usr/include:/Library/Developer/CommandLineTools/SDKs/MacOSX13.sdk/System/Library/Frameworks:$CP_SETUP/include
export CPLUS_INCLUDE_PATH
export PATH=$BREW_CELLAR/gcc/12.2.0/bin:$PATH

# cpg++
cpg++() {
  g++ -std=c++20 -O2 -Wl,-stack_size,0x20000000 -include $CP_SETUP/include/debug.h $1 -o ${1:0:-4}
}

# dbg++
dbg++() {
  g++ -std=c++20 -O2 -Wl,-stack_size,0x20000000 -include $CP_SETUP/include/debug.h -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-sanitize-recover=all -fstack-protector $1 -o ${1:0:-4}
}
