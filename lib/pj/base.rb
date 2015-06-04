require "thor"
require "clipboard"
require "pj"

module Pj
  class Base < Thor
    desc "sync", "git fetch upstream and merge upstream/master"
    def sync(project = nil)
      project = my_class_name if project.nil?
      repo = Pj::Git.new project
      if repo.upstream?
        repo.git "fetch upstream"
        repo.check_commit
        repo.git "merge upstream/master"
      else
        puts "Nothing to do. You don't have any upstream to sync"
      end
    end

    desc "push", "git push origin [branch]"
    def push(project = nil, branch = "master")
      project = my_class_name if project.nil?      
      repo = Pj::Git.new project
      repo.check_commit
      repo.push("origin", branch)
    end

    desc "owner", "git push origin and upstream [branch]"
    def owner(project = nil, branch = "master")
      project = my_class_name if project.nil?      
      repo = Pj::Git.new project
      if repo.upstream? && repo.origin?
        repo.check_commit
        repo.push("origin", branch)
        repo.push("upstream", branch)
      else
        puts "Nothing to do. You don't have origin && upstream"
      end
    end

    desc "cd", "copys cd to-repository command to clipboard"
    def cd(project = nil)
      project = my_class_name if project.nil?
      repo_dir = repository(project)
      cmd = "cd #{repo_dir}"
      Clipboard.copy cmd
      puts "#{cmd} copied to your clipboard. Paste and change directory"
      cmd
    end

    private

    def my_class_name
      self.class.name.downcase.split("::").last
    end

    def repository(project)
      Pj::Config.repository project
    end
  end
end
