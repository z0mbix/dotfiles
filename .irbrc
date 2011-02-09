# Tab completion
require "irb/completion"

# Use pretty print
require 'pp'

# Auto indent code
IRB.conf[:AUTO_INDENT]=true

# Use a simple prompt
#IRB.conf[:PROMPT_MODE] = :SIMPLE

# Readline-enable prompts.
require 'irb/ext/save-history'
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 2000
