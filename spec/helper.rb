require "fileutils"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pj"

def create_config_backup
  config = { repository: { pj: File.expand_path("../../", __FILE__) } }
  config_file_name = File.join ENV["HOME"], "pj.json"
  backup config_file_name
  File.open(config_file_name, "w") { |f| JSON.dump config, f }
end

def restore_config_backup
  config_file_name = File.join ENV["HOME"], "pj.json"
  rm config_file_name
  restore config_file_name
end

def backup(file_name, copy: false)
  file_name_bak = "#{file_name}.bak"
  return unless File.exist?(file_name)
  if copy
    FileUtils.cp(file_name, file_name_bak)
  else
    FileUtils.mv(file_name, file_name_bak)
  end
end

def touch(file_name)
  FileUtils.touch file_name
end

def rm(file_name)
  FileUtils.rm file_name
end

def restore(file_name)
  file_name_bak = "#{file_name}.bak"
  FileUtils.mv(file_name_bak, file_name) if File.exist?(file_name_bak)
end
