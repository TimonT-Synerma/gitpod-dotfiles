sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Oh My Zsh plugins to install
plugins=""git colorize zsh-sntax-highlighting"

sed -i "/^plugins/s/plugins=\(.*\)/plugins=\($plugins\)/g" /home/gitpod/.zshrc
