# You can override some default right prompt options in your config.fish:
     set -g theme_date_format "+%Y/%m/%d %H:%M:%S"

# ==============================
# Segment functions
# ==============================

function __bobthefish_start_rsegment -S -d 'Start a prompt segment'
  set -l bg $argv[1]
  set -e argv[1]
  set -l fg $argv[1]
  set -e argv[1]

  set_color normal # clear out anything bold or underline...
  set_color -b $bg $fg $argv

  switch "$__bobthefish_current_bg"
    case ''
      # If there's no background, just start one
      echo -n ' '
    case "$bg"
      # If the background is already the same color, draw a separator
      echo -ns $left_arrow_glyph ' '
    #case '*'
      # otherwise, draw the end of the previous segment and the start of the next
      #set_color $__bobthefish_current_bg
      #echo -ns $left_black_arrow_glyph ' '
      #set_color $fg $argv
  end

  set __bobthefish_current_bg $bg
end

function __bobthefish_finish_rsegments -S -d 'Close open prompt segments'
  if [ -n "$__bobthefish_current_bg" ]
    set_color normal
    set_color $__bobthefish_current_bg
    echo -ns $left_black_arrow_glyph ' '
  end

  set_color normal
  set __bobthefish_current_bg
end

function __bobthefish_cmd_duration -S -d 'Show command duration'
  [ "$theme_display_cmd_duration" = "no" ]; and return
  [ -z "$CMD_DURATION" -o "$CMD_DURATION" -lt 100 ]; and return

  if [ "$CMD_DURATION" -lt 5000 ]
    echo -ns $CMD_DURATION 'ms'
  else if [ "$CMD_DURATION" -lt 60000 ]
    __bobthefish_pretty_ms $CMD_DURATION s
  else if [ "$CMD_DURATION" -lt 3600000 ]
    set_color $fish_color_error
    __bobthefish_pretty_ms $CMD_DURATION m
  else
    set_color $fish_color_error
    __bobthefish_pretty_ms $CMD_DURATION h
  end

  set_color $fish_color_normal
  set_color $fish_color_autosuggestion

  [ "$theme_display_date" = "no" ]
    or echo -ns ' ' $__bobthefish_left_arrow_glyph
end

function __bobthefish_pretty_ms -S -a ms interval -d 'Millisecond formatting for humans'
  set -l interval_ms
  set -l scale 1

  switch $interval
    case s
      set interval_ms 1000
    case m
      set interval_ms 60000
    case h
      set interval_ms 3600000
      set scale 2
  end

  switch $FISH_VERSION
    # Fish 2.3 and lower doesn't know about the -s argument to math.
    case 2.0.\* 2.1.\* 2.2.\* 2.3.\*
      math "scale=$scale;$ms/$interval_ms" | string replace -r '\\.?0*$' $interval
    case \*
      math -s$scale "$ms/$interval_ms" | string replace -r '\\.?0*$' $interval
  end
end

function __bobthefish_timestamp -S -d 'Show the current timestamp'
  [ "$theme_display_date" = "no" ]; and return
  set -q theme_date_format
    or set -l theme_date_format "+%c"

  echo -n ' '
  date $theme_date_format
end

function __bobthefish_exit_status -S -d 'Show exit status'
  set_color normal
  set_color $color_bb
  echo -ns $left_black_arrow_glyph
  __bobthefish_start_rsegment $color_right
　if [ $exit_status -ne 0 ]
    set_color normal
    set_color -b $color_exit_error
    echo -ns $fail_glyph ' ' $exit_status ' '
  else
    set_color normal
    set_color -b $color_exit_status
    echo -ns $ok_glyph ' '
  end
end

function fish_right_prompt -d 'bobthefish is all about the right prompt'
  set -l exit_status $status
  set -l __bobthefish_left_arrow_glyph \uE0B3
  if [ "$theme_powerline_fonts" = "no" ]
    set __bobthefish_left_arrow_glyph '<'
  end

  #set_color $fish_color_autosuggestion
  #__bobthefish_cmd_duration

  __bobthefish_glyphs
  __bobthefish_colors $theme_color_scheme
  type -q bobthefish_colors
    and bobthefish_colors

  __bobthefish_exit_status

  #set_color $color_bb
  #echo -ns $left_black_arrow_glyph
  __bobthefish_start_rsegment $color_right
  __bobthefish_timestamp
  echo -ne ' ' $time_glyph ' '
  set_color normal
end
