fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path ~/.config/scripts
source (pyenv init - | psub)
set -gx EDITOR nvim
# Use gpg-agent for SSH auth
set -gx  SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
