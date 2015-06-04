require "clipboard"
require "helper"

RSpec.describe Pj::Base do
  before(:context) { create_config_backup }
  after(:context) { restore_config_backup }

  describe "#cd" do
    it "return cd command for the project" do
      repo = Pj::Config.repository "pj"
      cmd = "cd #{repo}"
      subject.cd "pj"
      expect(Clipboard.paste).to eq(cmd)
    end
  end

  describe "#push" do
    it "does git push origin [branch]" do
    end
  end
end
