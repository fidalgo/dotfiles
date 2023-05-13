module Config
  def self.copy
    puts "Copying config files"
    Dir.glob("dotfiles/**/*") do |item|
      target = File.expand_path("~/.#{item.sub("dotfiles/", "")}")
      if File.directory?(item)
        FileUtils.mkdir_p(target)
      elsif File.file?(item)
        FileUtils.cp(item, target, verbose: true)
      end
    end
  end
end
