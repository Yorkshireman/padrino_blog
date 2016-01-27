require 'spec_helper'

describe Post do
  let(:post){ Post.new }
  
  it 'can be created' do
    expect(post).to_not be_nil
  end

  it{ should belong_to :account }
  it{ should validate_presence_of :title }
  it{ should validate_presence_of :body }
  it{ should validate_presence_of :account }
end