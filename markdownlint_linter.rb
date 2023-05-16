# Add all rules
all

# Set minimum identation list as 2
rule 'MD007', :indent => 2

# Exclude line lenght check
exclude_rule 'MD013'

# Exclude ordered list item prefixt check
# Otherwise every markdown should use only one of the following styles, and bot are desired:
# - [1. 1. 1. ...]
# - [1. 2. 3. ...]
exclude_rule 'MD029'
