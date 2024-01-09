# Get all aliases and PATH variables
source "$HOME/.shells_common.sh"

# Vi-mode for bash
set -o vi

# Function to relay SSH traffic through ssh-j.com. Useful when the host is behind a NAT
# Copied from here: https://github.com/hackerschoice/thc-tips-tricks-hacks-cheat-sheet#ssh-j
sshj() {
	local pw
	pw=${1,,}
	[[ -z $pw ]] && {
		pw=$(head -c64 </dev/urandom | base64 | tr -d -c a-z0-9)
		pw=${pw:0:12}
	}
	echo "Press Ctrl-C to stop this tunnel."
	echo -e "To ssh to ${USER:-root}@${2:-127.0.0.1}:${3:-22} type: \e[0;36mssh -J ${pw}@ssh-j.com ${USER:-root}@${pw}\e[0m"
	ssh -o StrictHostKeyChecking=accept-new -o ServerAliveInterval=30 -o ExitOnForwardFailure=yes ${pw}@ssh-j.com -N -R ${pw}:22:${2:-0}:${3:-22}
}

# Setting up starship prompt (should be at the end)
eval "$(starship init bash)"
