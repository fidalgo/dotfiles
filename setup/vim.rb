module Vim
  def self.install
    system('vim -es -u "~/.vim/packages.vim" -i NONE -c "PlugUpdate" -c "qa"', exception: true)

    system('nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"', exception: true)
  end
end
