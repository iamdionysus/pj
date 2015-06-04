require "helper"

RSpec.describe Pj::Base do
  before(:context) { create_config_backup }
  after(:context) { restore_config_backup }

  describe "#my_repo_dir" do
    it "returns repository directory based on self class name" do
      expect(subject.my_repo_dir).not_to be_nil
    end
  end

  describe "#cd" do
    it "has default project argument as self.class.downcase" do
      cmd = subject.cd
      expect(cmd).to eq("cd base")
    end
    it "return cd command for the project" do
      repo_dir = Pj::Config.repo_dir "pj"
      expected = "cd #{repo_dir}"
      cmd = subject.cd "pj"
      expect(cmd).to eq(expected)
    end
  end

  describe "#push" do
    it "does git push origin [branch]" do
    end
  end
end
