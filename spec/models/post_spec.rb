require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "should have a user" do
    post = build(:post)
    expect(post.user.present?).to eq(true)
  end
end
