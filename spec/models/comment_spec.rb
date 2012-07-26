require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { user.microposts.build(content: "Micropost Lorem ipsum") }
  before { @comment = micropost.comments.build(content: "Comment Lorem ipsum") }

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:micropost_id) }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Comment.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when micropost_id is not present" do
    before { @comment.micropost_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @comment.content = " " }
    it { should_not be_valid }
  end

  describe "when content exceeds the valid length" do
    before { @comment.content = "a" * 501 }
    it { should_not be_valid }
  end
end
