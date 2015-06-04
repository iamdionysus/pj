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
      cmd
    end

    desc "push", "git push origin [branch]"
    def push(project, branch = "master")
      git = Pj::Git.new project
      if git.needs_commit?
        puts git.status_short
        puts "you have to commit the above changes first"
        puts "enter commit message:"
        msg = STDIN.gets.chomp
        git.commit msg
      end
      git.push("origin", branch)
    end

    private

    def repository(project)
      Pj::Config.repository project
    end
  end
end
