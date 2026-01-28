
# Ensure ~/.local/bin tools are on PATH (claude, uv, local scripts).
. "$HOME/.local/bin/env"

# Load user secrets (API keys, etc).
[ -f "$HOME/.config/secrets.env" ] && source "$HOME/.config/secrets.env"

# Smarter completion initialization (refresh cache once per day).
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
	compinit
else
	compinit -C
fi

# Pure theme
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# zsh-autosuggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting (load after autosuggestions)
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/christopher/.bun/_bun" ] && source "/Users/christopher/.bun/_bun"

# nvm: keep Node available for tools while preserving lazy-load.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	# Make /usr/bin/env node resolvable even before nvm is loaded.
	nvm_default_alias="$(cat "$NVM_DIR/alias/default" 2>/dev/null)"
	if [ -n "$nvm_default_alias" ]; then
		if [[ "$nvm_default_alias" == v* ]]; then
			nvm_default_dir="$NVM_DIR/versions/node/$nvm_default_alias"
		else
			nvm_default_dir="$(
				ls -d "$NVM_DIR/versions/node/v${nvm_default_alias}."* 2>/dev/null \
					| sort -V \
					| tail -n 1
			)"
		fi
		if [ -d "$nvm_default_dir/bin" ]; then
			export PATH="$nvm_default_dir/bin:$PATH"
		fi
	fi
	if [[ -o interactive ]]; then
		# Lazy-load nvm so interactive shells start fast.
		nvm() { unfunction nvm node npm; source "$NVM_DIR/nvm.sh"; nvm "$@"; }
		node() { unfunction nvm node npm; source "$NVM_DIR/nvm.sh"; node "$@"; }
		npm() { unfunction nvm node npm; source "$NVM_DIR/nvm.sh"; npm "$@"; }
	else
		# Non-interactive shells need nvm loaded so node is ready for scripts.
		source "$NVM_DIR/nvm.sh"
		nvm use default >/dev/null
	fi
fi
