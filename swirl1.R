install.packages("swirl")
packageVersion("swirl")
library(swirl)
ls()
rm(list=ls())
install_from_swirl("R Programming")
swirl()

bye()

# commands for swirl

# Typing skip() allows you to skip the current question.
# Typing play() lets you experiment with R on your own; swirl will ignore what you
# UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# Typing main() returns you to swirl's main menu.
# Typing info() displays these options again.

# hitting up arrow recycles commands!!!
# typing first 2 letters and tab key will provide a list of variables (auto-completion)
