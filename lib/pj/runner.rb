require "thor"
require "pj"

class Module
  def task(name, &block)
    define_method(name, &block)
  end
end

module Pj
  class Runner < Thor
    Pj::Config.projects.each do |p|
      desc("#{p} [sync|push|owner|cd]", "manages #{p} project")
      define_method(p.to_sym) do |*args|
        case args.shift
        when "sync"
          invoke "pj:base:sync", [p]
        when "push"
          invoke "pj:base:push", [p, args.first]
        when "owner"
          puts "owner"
        when "cd"
          invoke "pj:base:cd", [p]
        end
      end
    end
  end
end
