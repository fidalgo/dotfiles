module Bash
  def self.configure
    code = '
      if [[ -d "$HOME"/.config/bashrc.d ]] ; then
        for config in $HOME/.config/bashrc.d/*.bash ; do
          . "$config"
        done
      fi
    '

    puts "Copying bashrc.d files"
    FileUtils.cp_r "bashrc.d", File.expand_path("~/.config/")

    puts "Adding code to load .config/bashrc.d/* files"
    pattern = 'if [[ -d "$HOME"/.config/bashrc.d ]] ; then'
    add_code_to_bashrc(code, pattern)
  end

  def self.add_code_to_bashrc(code_to_add, unique_pattern)
    bashrc_path = File.expand_path("~/.bashrc")
    content = File.exist?(bashrc_path) ? File.read(bashrc_path) : ""
    return if content.include? unique_pattern

    File.open(bashrc_path, "a") { |file| file.puts(code_to_add) }
  end
end
