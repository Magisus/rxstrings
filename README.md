# rxstrings
A simple tool to recursively parse a Ruby source code tree, extract strings
(basic strings, formatted strings, heredocs, etc.) and compute some basic
statistics.

Usage: `rxstrings` [OPTIONS] [FILE ...] [DIRECTORY ...]
* -u|--umark         Show unmarked strings
* -m|--mark          Show marked strings
* -a|--all           Show all strings
* -f|--file-stats    Show per-file statistics
* -s|--string-stats  Show per-string statistics
* -d|--debug         Show parse tree
* -h|--help          Show help text
