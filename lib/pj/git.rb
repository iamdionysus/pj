require "pj"

module Pj
  class Git
    def initialize(repo_name)
      @repo = Pj::Config.repository(repo_name)
    end

    def needs_commit?
      status_short.empty? ? false : true
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
