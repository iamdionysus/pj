require "pj"

module Pj
  class Git
    def initialize(repo_name)
      @repo = Pj::Config.repo_dir(repo_name)
    end

    def needs_commit?
      status_short.empty? ? false : true
    end

    def upstream?
      msg = git "remote --verbose"
      msg.include? "upstream"
    end

    def origin?
      msg = git "remote --verbose"
      msg.include? "origin"
    end

    def check_commit
      return unless needs_commit?
      puts status_short
      puts "you have to commit the above changes first"
      puts "enter commit message:"
      msg = STDIN.gets.chomp
      commit msg
    end

    def commit(msg)
      git "add --all"
      git "commit --all --message=\"#{msg}\""
    end

    def status
      git "status"
    end

    def status_short
      git "status --short"
    end

    def push(remote, branch)
      git "push #{remote} #{branch}"
    end

    def git(cmd)
      Dir.chdir(@repo) { `git #{cmd}` }
    end
  end
end
