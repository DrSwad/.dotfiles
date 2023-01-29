# g++
CPLUS_INCLUDE_PATH=/opt/homebrew/Cellar/gcc@12/12.1.0_1/include/c++/12:/opt/homebrew/Cellar/gcc@12/12.1.0_1/include/c++/12/aarch64-apple-darwin21:/Users/drswad/Desktop/CP/Setup/include
export CPLUS_INCLUDE_PATH
export PATH=/opt/homebrew/Cellar/gcc@12/12.1.0_1/bin:$PATH

# cpg++
cpg++() {
  g++ -std=c++20 -O2 -Wl,-stack_size,0x20000000 -include $CP_SETUP/include/debug.h $1 -o ${1:0:-4}
}

# dbg++
dbg++() {
  g++ -std=c++20 -O2 -Wl,-stack_size,0x20000000 -include $CP_SETUP/include/debug.h -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-sanitize-recover=all -fstack-protector $1 -o ${1:0:-4}
}
