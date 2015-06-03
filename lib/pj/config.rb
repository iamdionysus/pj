require "json"

module Pj
  class Config
    class << self
      def instance
        @instance ||= new
      end

      def repository(name)
        instance.repository name
      end

      def projects
        instance.projects
      end
    end

    def initialize
      @config = load_config
    end

    def repository(name)
      return nil unless @config.key?("repository")
      @config["repository"].fetch(name, nil)
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
