require "thor"
require "pj"

module Pj
  class Runner < Thor
    Pj::Config.projects.each do |project|
      desc("#{project} [sync|push|owner|cd]", "manages #{project} project")
      define_method(project.to_sym) do |*args|
        case args.shift
        when "sync", "s"
          invoke "pj:base:sync", [project]
        when "push", "p"
          branch = args.shift || "master"
          invoke "pj:base:push", [project, branch]
        when "owner", "o"
          branch = args.shift || "master"
          invoke "pj:base:owner", [project, branch]
        when "cd"
          invoke "pj:base:cd", [project]
        end
      end
    end
  end
end
