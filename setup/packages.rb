require 'net/http'
require 'open-uri'
require 'tempfile'

class Packages
  BIN_DIR = File.expand_path('~/bin')
  FONT_DIR = File.expand_path('~/.local/share/fonts')

  def self.install
    new(:install).install_packages
  end

  def self.uninstall
    new(:uninstall).uninstall_packages
  end

  def initialize(mode)
    @mode = mode
  end

  def install_packages
    setup_directories
    packages.each(&:install)
  end

  def uninstall_packages
    packages.each(&:uninstall)
  end

  private

  def setup_directories
    [BIN_DIR, FONT_DIR].each { |dir| FileUtils.mkdir_p(dir) unless Dir.exist?(dir) }
  end

  def packages
    @packages ||= [Hivemind.new, Rtx.new, Stylua.new, Packer.new, Fonts.new, VimPlug.new]
  end
end

class Package
  def install?
    @mode == :install
  end

  def uninstall
    FileUtils.rm_f(path)
  end

  def download_file(url, destination)
    uri = URI.parse(url)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri.request_uri)

      http.request(request) do |response|
        File.open(destination, 'wb') do |file|
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

      system("unzip -o #{temp_file.path} -d #{File.dirname(destination)}")
    end
  end

  def download_and_gunzip(url, destination)
    Tempfile.create do |temp_file|
      system("curl -s -L -o #{temp_file.path} '#{url}'")
      system("gzip -dc #{temp_file.path} > #{destination}")
    end
  end

  private

  def path
    raise NotImplementedError
  end
end

class Rtx < Package
  def install
    return if File.exist?(path)

    puts 'Installing rtx'
    download_file('https://rtx.pub/rtx-latest-linux-x64', path)
    FileUtils.chmod('u+x', path)
  end

  private

  def path
    File.join(Packages::BIN_DIR, 'rtx')
  end
end

class Stylua < Package
  def install
    return if File.exist?(path)

    puts 'Installing stylua'
    url = 'https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip'
    puts path
    download_and_unzip(url, path)
    FileUtils.chmod('u+x', path)
  end

  private

  def path
    File.join(Packages::BIN_DIR, 'stylua')
  end
end

class Hivemind < Package
  def install
    return if File.exist?(path)

    puts 'Installing Hivemind'
    url = 'https://github.com/DarthSim/hivemind/releases/latest/download/hivemind-v1.1.0-linux-amd64.gz'
    download_and_gunzip(url, path)
    FileUtils.chmod('u+x', path)
  end

  private

  def path
    File.join(Packages::BIN_DIR, 'hivemind')
  end
end

class Packer < Package
  def install
    return if Dir.exist?(path)

    puts 'Installing packer'
    FileUtils.mkdir_p(path) unless Dir.exist?(path)
    `git clone --depth 1 https://github.com/wbthomason/packer.nvim #{path}`
  end

  private

  def path
    File.expand_path('~/.local/share/nvim/site/pack/packer/start/packer.nvim')
  end
end

class VimPlug < Package
  def install
    puts 'Installing vim-plug'
    FileUtils.mkdir_p(path) unless Dir.exist?(path)
    download_file('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', "#{path}/plug.vim")
  end

  private

  def path
    File.expand_path('~/.vim/autoload')
  end
end

class Fonts < Package
  def install
    urls.each do |url|
      name = File.basename(url)
      font_path = File.join(path, name)
      next if File.exist?(font_path)

      puts "Installing font #{name}"
      download_file(url, font_path)
    end
  end

  def uninstall
    urls.each do |url|
      name = File.basename(url)
      font_path = File.join(path, name)
      FileUtils.rm_f(font_path)
    end
  end

  private

  def urls
    [
      'https://github.com/intel/intel-one-mono/releases/latest/download/otf.zip'
    ]
  end

  def path
    Packages::FONT_DIR
  end
end
