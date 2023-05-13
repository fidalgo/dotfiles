require "net/http"
require "open-uri"
require "tempfile"

class Packages
  BIN_DIR = File.expand_path("~/bin")
  FONT_DIR = File.expand_path("~/.local/share/fonts")

  def self.install
    [BIN_DIR, FONT_DIR].each { |dir| FileUtils.mkdir_p(dir) unless Dir.exist?(dir) }

    new(:uninstall).packages if ARGV.include?("--reset")

    new(:install).packages
  end

  def self.uninstall
    new(:uninstall).packages
  end

  def initialize(mode)
    @mode = mode
  end

  def packages
    rtx
    packer
    vim_plug
    fonts
    stylua
  end

  private

  def install?
    @mode == :install
  end

  def download_file(url, destination)
    uri = URI.parse(url)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
      request = Net::HTTP::Get.new(uri.request_uri)

      http.request(request) do |response|
        File.open(destination, "wb") do |file|
          response.read_body do |chunk|
            file.write(chunk)
          end
        end
      end
    end
  end

  def download_and_unzip(url, destination)
    Tempfile.create do |temp_file|
      system("curl -s -L -o #{temp_file.path} '#{url}'")
      system("unzip -o #{temp_file.path} -d #{destination}")
    end
  end

  def rtx
    path = File.join(BIN_DIR, "rtx")
    if install?
      return if File.exist?(path)

      puts "Installing rtx"
      download_file("https://rtx.pub/rtx-latest-linux-x64", path)
      FileUtils.chmod("u+x", path)
    else
      FileUtils.rm_f(path)
    end
  end

  def stylua
    path = File.join(BIN_DIR, "stylua")
    if install?
      return if File.exist?(path)

      puts "Installing stylua"
      url = "https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip"
      download_and_unzip(url, BIN_DIR)
      FileUtils.chmod("u+x", path)
    else
      FileUtils.rm_f(path)
    end
  end

  def packer
    path = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if install?
      return if Dir.exist?(path)

      puts "Installing packer"
      FileUtils.mkdir_p(path)
      `git clone --depth 1 https://github.com/wbthomason/packer.nvim #{path}`
    else
      FileUtils.rm_rf(path)
    end
  end

  def fonts
    urls = [
      "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/InconsolataNerdFontMono-Regular.ttf"
    ]

    urls.each do |url|
      name = File.basename(url)
      path = File.join(FONT_DIR, name)
      if install?
        next if File.exist?(path)

        puts "Installing font #{name}"
        download_file(url, path)
      else
        FileUtils.rm_f(path)
      end
    end
  end

  def vim_plug
    path = File.expand_path("~/.vim/autoload")

    if install?
      puts "Installing vim-plug"
      FileUtils.mkdir_p(path)
      download_file("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", "#{path}/plug.vim")
    else
      FileUtils.rm_f(path)
    end
  end
end
