require "helper"

RSpec.describe Pj::Base do
  before(:context) { create_config_backup }
  after(:context) { restore_config_backup }

  describe "#cd" do
    it "has default project argument as self.class.downcase" do
      cmd = subject.cd
      expect(cmd).to eq("cd base")
    end
    it "return cd command for the project" do
      repo = Pj::Config.repository "pj"
      expected = "cd #{repo}"
      cmd = subject.cd "pj"
      expect(cmd).to eq(expected)
    end
  end

  describe "#push" do
    it "does git push origin [branch]" do
    end
  end
end
