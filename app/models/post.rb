class Post < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :title, :body, :account
end
