module Backup
  BACKUP_TO = File.expand_path("~/.dotfiles_backup")

  def self.perform
    destination = "#{BACKUP_TO}/#{Time.now.strftime("%Y-%m-%d_%H-%M-%S")}"
    FileUtils.mkdir_p destination
    FileUtils.mv Dir.glob(File.expand_path("~/.vim*")), destination
  end
end
