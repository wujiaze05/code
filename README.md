# code
Source code for python, shell, vim and other stuffs

# https://wujz@bitbucket.org/wujz/cxx.git/


# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#include <stdio.h>
void perror(const char *s);
#define handleError(msg) do { perror(msg); exit(EXIT_FAILURE); } while (0)

#include <sys/mman.h>
// prot - PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
// flag - MAP_SHARED, MAP_SHARED_VALIDATE, MAP_PRIVATE
// Return value: valid address or MAP_FAILED(-1)
void* mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
void *mremap(void *old_address, size_t old_size, size_t new_size, int flags, ... /* void *new_address */);
int munmap(void *addr, size_t length);

