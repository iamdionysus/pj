require "thor"
require "clipboard"
require "pj"

module Pj
  class Base < Thor
    desc "cd", "copys cd to-repository command to clipboard"
    def cd(project)
      repo = repository(project)
      cmd = "cd #{repo}"
      Clipboard.copy cmd
      puts "#{cmd} copied to your clipboard. Paste and change directory"
    end

    desc "push", "git push origin [branch]"
    def push(project, branch)
      # use ruby-git
    end

    private

    def repository(project)
      Pj::Config.repository project
    end
  end
end
