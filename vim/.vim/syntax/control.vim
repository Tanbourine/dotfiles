" Vim syntax file for Control Code
" Language: Control Code
" Maintainer: Nathan Inkley

syn match Statement "*"
syn match Statement "**"
syn match Statement "-"
syn match Statement "+"
syn match Statement "="
syn match Statement "=="
syn match Statement ":"
syn match Statement "("
syn match Statement ")"
syn match Statement "<"
syn match Statement ">"
syn match Statement ","
syn match Comment "#.*$"
syn keyword Statement let stateful if elif else and or not return for transition wait_until timeout pass
syn keyword Statement alert bool float64 int64 uint64 state_machine state controller sequence mutable
syn keyword Statement input output command timed_sequence sub_sequence until calcs monitor def enum state_group
syn region Type start="|" end="|"
set autoindent ts=4 sw=4 expandtab
:retab
