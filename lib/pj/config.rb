require "json"

module Pj
  class Config
    class << self
      def instance
        @instance ||= new
      end

      def repo_dir(name)
        instance.repo_dir name
      end

      def projects
        instance.projects
      end
    end

    def initialize
      @config = load_config
    end

    def repo_dir(name)
      return nil unless @config.key?("repository")
      repo = @config["repository"].fetch(name, nil)
      File.expand_path repo
    end

    def projects
      @config["repository"].keys
    end

    def load_config
      JSON.load(File.read(config_file_name))
    end

    def config_file_name
      File.join ENV["HOME"], "pj.json"
    end
  end
end
