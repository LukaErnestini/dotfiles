if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/cursor.sh

# Set DOTNET_ROOT
set -gx DOTNET_ROOT $HOME/.dotnet

# Add .NET to PATH
fish_add_path $DOTNET_ROOT $DOTNET_ROOT/tools
# pnpm
set -gx PNPM_HOME "/home/lukaernestini/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
