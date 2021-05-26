set -gx PATH ~/bin ~/.local/bin $PATH
set -gx EDITOR nvim
# Use gpg-agent for SSH auth
set -gx  SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
