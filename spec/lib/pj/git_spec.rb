require "helper"

RSpec.describe Pj::Git do
  before(:context) { create_config_backup }
  after(:context) { restore_config_backup }

  subject { Pj::Git.new "pj" }
  describe Pj::Git do
    describe "#needs_commit?" do
      it "checks whether commit is needed" do
        touch "test.txt" # to make it needed to commit
        expect(subject.needs_commit?).to be true
        rm "test.txt" # remove the test file
      end
    end

    describe "#git" do
      it "runs git command inside repository" do
        message = subject.git "status"
        expect(message).to match(/On branch/)
      end
    end

    # it creates commit messages too much
    # describe "#commit" do
    #   it "commits message" do
    #     touch "test.txt"
    #     expect(subject.commit "added test.txt").not_to be_empty
    #     rm "test.txt"
    #     expect(subject.commit "removed test.txt").not_to be_empty
    #   end
    # end

    describe "#push" do
      it "push to remote" do
      end
    end
  end
end
