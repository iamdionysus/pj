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
      task(p.to_sym) do |args = nil|
        case args
        when "sync"
          puts "sync"
        when "push"
          puts "push"
        when "owner"
          puts "owner"
        when "cd"
          invoke "pj:base:cd", [p]
        end
      end
    end
  end
end
