require "json"
require "helper"

RSpec.describe Pj::Config do
  let(:config_file_name) { File.join ENV["HOME"], "pj.json" }
  let(:config) do
    { "repository" =>
      {
        "pj" => File.expand_path("../../../../", __FILE__),
        "base" => "base"
      }
    }
  end
  before(:context) { create_config_backup }
  after(:context) { restore_config_backup }

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
      expect(subject.projects).to eq(%w(pj base))
    end
  end

  describe "#repo_dir" do
    it "returns repository directory given correct name" do
      expected = config["repository"]["pj"]
      expect(subject.repo_dir("pj")).to eq(expected)
    end

    it "returns nil given wrong name" do
      expect(subject.repo_dir("wrong")).to be_nil
    end
  end
end
