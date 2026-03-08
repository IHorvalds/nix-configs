#!/usr/bin/env bash

term_str=" "
if [ -n "$TERM" ] && [ "$TERM" == "xterm-ghostty" ]; then
  term_str+=""
else
  term_str+=""
fi

echo "$term_str"
