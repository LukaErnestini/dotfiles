if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $PATH /opt/nvim/

nvm use lts

# Undo the last commit but keep changes staged
abbr -a gundo 'git reset --soft HEAD~1'

# Undo the last commit and unstage the changes
abbr -a gundo-hard 'git reset --mixed HEAD~1'

# Completely remove the last commit (use with caution)
abbr -a gundo-drop 'git reset --hard HEAD~1'

# Add and commit all changes with a message
abbr -a gcom 'git commit -am'

# Amend the last commit without changing the message
abbr -a gamend 'git commit --amend --no-edit'

# Amend the last commit and edit the message
abbr -a gamend-edit 'git commit --amend'

# Push changes with force but without overwriting other changes
abbr -a gpush-force 'git push --force-with-lease'

# Show commit history in a compact graph
abbr -a glog 'git log --oneline --graph --decorate --all'

# Show status of the repository
abbr -a gstat 'git status -sb'

# Fetch latest changes without merging
abbr -a gfetch 'git fetch --all --prune'

# Pull latest changes with rebase
abbr -a gpull 'git pull --rebase'

# Switch to the previous branch
abbr -a gprev 'git checkout -'

# Create a new branch and switch to it
abbr -a gnew 'git checkout -b'

# Stash changes
abbr -a gstash 'git stash'

# Stash and apply immediately
abbr -a gstash-pop 'git stash pop'

# Restore staged files
abbr -a grestore 'git restore --staged .'

# Clean untracked files and directories (DANGEROUS!)
abbr -a gclean 'git clean -fd'

# Hard reset to origin/main (use with caution)
abbr -a greset-hard 'git reset --hard origin/main'

# Remove local branches that have been merged
abbr -a gprune 'git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'

# Show list of remotes
abbr -a gremote 'git remote -v'

# Set upstream for the current branch
abbr -a gset-upstream 'git push --set-upstream origin (git branch --show-current)'

# List all branches sorted by last commit date
abbr -a gbranches 'git branch --sort=-committerdate'

# Show detailed last commit
abbr -a glast 'git log -1 --stat'

fish_add_path /opt/bitwarden
fish_add_path /opt/keymapp

# Get local user password from Bitwarden
abbr -a bwpass 'bw get password "lukae local user" | xclip -selection clipboard'

# Generate TOTP using secret stored in $OATHTOOL_SECRET (set in conf.d/private.fish)
abbr -a oath 'oathtool --totp -b "$OATHTOOL_SECRET" | xclip -selection clipboard'

fish_add_path /home/lukaernestini/.dotnet/tools
# pnpm
set -gx PNPM_HOME "/home/lukaernestini/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
