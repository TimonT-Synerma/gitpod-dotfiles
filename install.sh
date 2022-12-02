#Oh My Zsh plugins to install
plugins="git colorize zsh-autosuggestions zsh-syntax-highlighting"

aliases='alias dcd="docker compose -f docker-compose.dev.yml"
alias dcdr="docker compose -f docker-compose.dev.yml run rails"
alias dct="docker compose -f docker-compose.test.yml"
alias lzg="lazygit"
alias lzd="lazydocker"'

#Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Write plugins to .zshrc
sed -i "/^plugins/s/plugins=\(.*\)/plugins=\($plugins\)/g" /home/gitpod/.zshrc

#Write aliases to the plugin folder
echo "$aliases" | tee -a /home/gitpod/.oh-my-zsh/custom/aliases.zsh /home/gitpod/.bashrc > /dev/null

#Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/gitpod/.oh-my-zsh/custom/themes/powerlevel10k
#Write theme to .zshrc
sed -i "/^ZSH_THEME=\"/s/.*/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" /home/gitpod/.zshrc

#Append p10k config to beginning of .zshrc file. Enables instant prompt
echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
'"$(cat /home/gitpod/.zshrc)" > /home/gitpod/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> /home/gitpod/.zshrc

#copy p10k config file from dotfiles repo to workspace
mv ~/.dotfiles/.p10k.zsh /home/gitpod/.p10k.zsh

#Install zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions /home/gitpod/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/gitpod/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
