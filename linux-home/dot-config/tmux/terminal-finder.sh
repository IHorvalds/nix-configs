#!/usr/bin/env bash

if [ -n "$TERM" ] && [ "$TERM" == "xterm-ghostty" ]; then
  echo "👻"
else
  echo ""
fi

