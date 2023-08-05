#!/usr/bin/env ruby
require 'fileutils'
require 'open-uri'
require 'time'

require_relative 'setup/backup'
require_relative 'setup/bash'
require_relative 'setup/config'
require_relative 'setup/packages'

def print_help
  puts <<~HELP
    Usage: ruby #{__FILE__} [OPTIONS]
    OPTIONS:
      --install     Install configuration [Default option]
      --reset       Reset the configuration
      --backup      Backup the current configuration
      --restore     Restore from a backup
      --help        Show this help message
  HELP
end

def install
  Config.copy
  Packages.install
  Bash.configure
end

def main
  case ARGV[0]
  when '--reset'
    Packages.uninstall
    install
  when '--backup'
    BackupManager.backup
  when '--restore'
    if ARGV[1] && File.exist?(ARGV[1])
      BackupManager.restore(ARGV[1])
    else
      puts 'Please provide a valid path to the encrypted backup file for restoration.'
    end
  when '--help'
    print_help
  else
    install
  end
end

main
