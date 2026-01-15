#!/bin/bash

MAX_LEN=30

status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  artist=$(playerctl -p spotify metadata artist 2>/dev/null)

  text="$artist"

  if [ ${#text} -gt $MAX_LEN ]; then
    text="${text:0:$MAX_LEN}…"
  fi

  printf '{"text": "%s"}\n' " ⏸ $text"

elif [ "$status" = "Paused" ]; then
  printf '{"text": "%s"}\n' " ▶ Paused"
fi

