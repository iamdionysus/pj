require "thor"
require "pj"

class Module
  def task(name, &block)
    define_method(name, &block)
  end
end

module Pj
  class Runner < Thor
    Pj::Config.projects.each do |project|
      desc("#{project} [sync|push|owner|cd]", "manages #{project} project")
      define_method(project.to_sym) do |*args|
        case args.shift
        when "sync"
          invoke "pj:base:sync", [project]
        when "push"
          branch = args.shift || "master"
          invoke "pj:base:push", [project, branch]
        when "owner"
          branch = args.shift || "master"
          invoke "pj:base:owner", [project, branch]
        when "cd"
          invoke "pj:base:cd", [project]
        end
      end
    end
  end
end
