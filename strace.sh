#!/bin/bash
echo "=== COMPILING ==="
gcc -o parent parent.c
gcc -o child child.c

echo ""
echo "=== STRACE DEMO - PARENT PROCESS ==="
echo "Look for:"
echo "  - clone (fork) - process creation"
echo "  - pipe - pipe creation" 
echo "  - dup2 - file descriptor duplication"
echo "  - execve - process image replacement"
echo ""

# Запускаем с strace и фильтруем ключевые вызовы
strace -f -e trace=fork,clone,pipe,dup2,execve,wait4 ./parent 2>&1 | grep -v "+++"

echo ""
echo "=== NORMAL EXECUTION ==="
./parent


