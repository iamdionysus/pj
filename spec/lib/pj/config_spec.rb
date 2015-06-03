require "json"
require "helper"


RSpec.describe Pj::Config do
  let(:config_file_name) { File.join ENV["HOME"], "pj.json" }
  let(:config) { { "repository" => { "pj" => File.dirname(__FILE__) } } }
  before(:context) do
    config = { repository: { pj: File.dirname(__FILE__) } }
    config_file_name = File.join ENV["HOME"], "pj.json"
    backup config_file_name
    File.open(config_file_name, "w") { |f| JSON.dump config, f }
  end

  after(:context) do
    config_file_name = File.join ENV["HOME"], "pj.json"
    rm config_file_name
    restore config_file_name
  end

  describe "#config_file_name" do
    it "returns config file name" do
      expect(subject.config_file_name).to eq(config_file_name)
    end
  end

  describe "#load_config" do
    it "loads config into hash" do
      expect(subject.load_config).to eq(config)
    end
  end

  describe "#projects" do
    it "returns all projects name in config" do
      expect(subject.projects).to eq(["pj"])
    end
  end

  describe "#repository" do
    it "returns repository directory given correct name" do
      expected = config["repository"]["pj"]
      expect(subject.repository("pj")).to eq(expected)
    end

    it "returns nil given wrong name" do
      expect(subject.repository("wrong")).to be_nil
    end
  end
end
