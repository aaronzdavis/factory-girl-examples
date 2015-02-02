require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    User.delete_all
  end

  it "should validate presence of username" do
    user = build(:user)
    user.username = nil
    expect(user).to be_invalid
  end

  it "a user with private settings is private" do
    user = build(:private_user)
    expect(user.settings_private).to eq(true)
  end

  it "#is_underage? check if user is 21+" do
    underage_user = build(:underage_user)
    expect(underage_user.is_underage?).to eq(true)

    of_age_user = build(:user)
    expect(of_age_user.is_underage?).to eq(false)
  end

  it "check for uniquneses in username" do
    # Create a user with a username
    user = create(:user)

    # Create a user with the same username as user #1
    user2 = build(:user, username: user.username)

    # Should be invalid
    expect(user2).to be_invalid
  end

  it "#power_user? should be true for users with 1000+ posts" do
    # Create a user with 1000 posts
    user = create(:user_with_posts, posts_count: 1000)

    # Should be a power_user
    expect(user.power_user?).to eq(true)
  end

  it "#inactive? should be true for users without posts in the last 30 days" do
    user = create(:user)

    # Add an old post to user
    user.posts << create(:post, created_at: 50.days.ago)

    # User should be inactive
    expect(user.inactive?).to eq(true)
  end


end
