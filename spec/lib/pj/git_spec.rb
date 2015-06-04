require "helper"

RSpec.describe Pj::Git do
  before(:context) do
    create_config_backup
    # touch "test.txt"
  end

  after(:context) do
    restore_config_backup
    rm "test.txt"
  end

  subject { Pj::Git.new "pj" }
  describe Pj::Git do
    describe "#status_short" do
      it "returns git status --short message" do
        expect(subject.status_short).not_to be_empty
      end
    end
    describe "#needs_commit?" do
      it "checks whether commit is needed" do
        expect(subject.needs_commit?).to be true
      end
    end

    describe "#git" do
      it "runs git command inside repository" do
        message = subject.git "status"
        expect(message).to match(/On branch/)
      end
    end
  end
end
