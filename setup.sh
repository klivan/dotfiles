# Source: https://x.com/r_marked/status/1873494901620650364
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enable brew
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and casks with brew
echo "Installing programs with homebrew"
brew update
brew upgrade

# brew install --cask 1password 1password-cli discord karabiner-elements orbstack raycast rectangle-pro shottr visual-studio-code
# brew install corepack deno dockutil fnm gh git httpie iperf3 node plow stripe tfenv tmux fzf

brew install ripgrep fastfetch font-fira-code grpcui yt-dlp terraformer ghostty git tmux fzf zsh-syntax-highlighting zsh-autosuggestions meetingbar neovim dockutil
brew install --cask font-maple discord 1password 1password-cli rectangle-pro visual-studio-code orbstack obsidian

# enable automatic updates every 12 hours
echo "Enabling autoupdate for homebrew packages..."
brew tap homebrew/autoupdate
brew autoupdate start 43200 --upgrade

# Set up dock icons
echo "Setting up dock"
dockutil --remove all --no-restart
dockutil --add "/Applications/Visual Studio Code.app" --no-restart
dockutil --add "/Applications/Ghostty.app" --no-restart
dockutil --add "/Applications/Google Chrome.app" --no-restart
dockutil --add "/Applications/Obsidian.app" --no-restart
dockutil --add "/Applications/Discord.app" --no-restart
dockutil --add "/System/Applications/Messages.app" --no-restart
dockutil --add "/System/Applications/Notes.app" --no-restart
dockutil --add "/System/Applications/Utilities/Activity Monitor.app" --no-restart
dockutil --add "/System/Applications/System Settings.app" --no-restart

# Folders to add to the dock
dockutil --add '/Applications' --view grid --display folder --no-restart
dockutil --add '~/Documents' --view list --display folder --no-restart
dockutil --add '~/Downloads' --view list --display folder

# xcode command line tools
xcode-select --install

# oh-my-tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

eval "$(op signin)"

# set up ssh keys
echo "Setting up SSH keys"
mkdir -p ~/.ssh
op read "op://Private/Github SSH Key/private key" -o ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
ssh-add ~/.ssh/id_ed25519

# Set up dock hiding if on a laptop
dockconfig() {
  printf "\nLaptop selected, setting up dock hiding."
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0
  killall Dock
}

dockconfig

# configure rectangle pro to use icloud sync and launch on login
echo "Updating RectanglePro config"
/usr/libexec/PlistBuddy -c 'delete :iCloudSync' /Users/mrf/Library/Preferences/com.knollsoft.Hookshot.plist
/usr/libexec/PlistBuddy -c 'add :iCloudSync bool true' /Users/mrf/Library/Preferences/com.knollsoft.Hookshot.plist
/usr/libexec/PlistBuddy -c 'delete :launchOnLogin' /Users/mrf/Library/Preferences/com.knollsoft.Hookshot.plist
/usr/libexec/PlistBuddy -c 'add :launchOnLogin bool true' /Users/mrf/Library/Preferences/com.knollsoft.Hookshot.plist

echo "Updating macOS settings"

# Avoid the creation of .DS_Store files on network volumes or USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Dock tweaks
defaults write com.apple.dock show-recents -bool FALSE # Disable "Show recent applications in dock"
defaults write com.apple.Dock showhidden -bool TRUE    # Show hidden applications as translucent
killall Dock

# Finder tweaks
defaults write NSGlobalDomain AppleShowAllExtensions -bool true            # Show all filename extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable warning when changing a file extension
defaults write com.apple.finder FXPreferredViewStyle Clmv                  # Use column view
defaults write com.apple.finder AppleShowAllFiles -bool true               # Show hidden files
defaults write com.apple.finder ShowPathbar -bool true                     # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                   # Show status bar
killall Finder

# Disable "the disk was not ejected properly" messages
defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES
killall diskarbitrationd


echo "Starting services"
open "/Applications/Rectangle Pro.app"

echo "Removing config programs"
brew remove dockutil

# oh-my-zsh (must be last)
sh -c "$(curl -# -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add ssh-agent plugin
#sed -i -e 's/plugins=(git)/plugins=(git ssh-agent)/' ~/.zshrc

# fnm stuff
#echo "eval \"\$(fnm env --use-on-cd)\"" >>~/.zshrc

# fzf
source <(fzf --zsh)

# finish
source ~/.zshrc
