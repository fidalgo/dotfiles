#!/usr/bin/env ruby
require 'fileutils'
require 'open-uri'
require 'time'

require_relative 'setup/backup'
require_relative 'setup/vim'
require_relative 'setup/bash'
require_relative 'setup/config'
require_relative 'setup/packages'

def print_help
  puts <<~HELP
    Usage: ruby #{__FILE__} [OPTIONS]
    OPTIONS:
      --reset       Reset the configuration
      --backup      Backup the current configuration
      --help        Show this help message
  HELP
end

def main
  case ARGV[0]
  when '--reset'
    Packages.uninstall
    Backup.perform
  when '--backup'
    Backup.perform
  when '--help'
    print_help
  else
    Config.copy
    Packages.install
    Bash.configure
    Vim.install
  end
end

main
