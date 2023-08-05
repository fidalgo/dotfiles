#!/usr/bin/env ruby

require 'fileutils'

class BackupManager
  DIRECTORIES_TO_BACKUP = [
    '/etc/NetworkManager',
    '/etc/ssl/certs',
    '~/Documents',
    '~/.ssh',
    '~/.gnupg',
    '~/.config/Signal',
    '~/.bundle',
    '~/.npmrc',
    '~/.cert'
  ].freeze

  BACKUP_DIR = Dir.home
  BACKUP_FILENAME_FORMAT = 'backup_%<timestamp>s.tar.gz'
  ENCRYPTED_EXT = '.gpg'

  class << self
    def backup
      backup_path = generate_backup_path
      create_backup(backup_path)
      encrypt_backup(backup_path)
      FileUtils.rm(backup_path)
      puts "Backup encrypted and saved to #{backup_path + ENCRYPTED_EXT}"
    end

    def restore(encrypted_backup_path)
      unless encrypted_backup_path
        puts 'Please provide the path to the encrypted backup file.'
        return
      end

      unless File.exist?(encrypted_backup_path)
        puts 'The provided file does not exist.'
        return
      end

      decrypted_backup_path = encrypted_backup_path.gsub(ENCRYPTED_EXT, '')
      decrypt_backup(encrypted_backup_path, decrypted_backup_path)
      extract_backup(decrypted_backup_path)
      FileUtils.rm(decrypted_backup_path)
      puts "Backup restored from #{encrypted_backup_path}"
    end

    private

    def generate_backup_path
      File.join(BACKUP_DIR, format(BACKUP_FILENAME_FORMAT, timestamp: Time.now.strftime('%Y%m%d_%H%M%S')))
    end

    def create_backup(backup_path)
      system("sudo tar -czpf #{backup_path} -C #{BACKUP_DIR} #{DIRECTORIES_TO_BACKUP.join(' ')}")
      system("sudo chown #{ENV['USER']}:#{ENV['USER']} #{backup_path}")
    end

    def encrypt_backup(backup_path)
      system("gpg -c --cipher-algo AES256 #{backup_path}")
    end

    def decrypt_backup(encrypted_path, output_path)
      system("gpg -o #{output_path} -d #{encrypted_path}")
    end

    def extract_backup(backup_path)
      timestamp = File.basename(backup_path).match(/backup_(\d{8}_\d{6})/)[1]
      restore_dir = File.join(BACKUP_DIR, "restore_#{timestamp}")
      FileUtils.mkdir_p(restore_dir)
      system("sudo tar -xzpf #{backup_path} -C #{restore_dir}")
      puts "Backup contents extracted to #{restore_dir}. Review and move them as needed."
    end
  end
end
