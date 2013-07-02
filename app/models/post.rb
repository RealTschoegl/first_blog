class Post < ActiveRecord::Base
  attr_accessible :body, :title, :author

  validates_presence_of :title, :body, :author
end
