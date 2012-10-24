class Shortener < ActiveRecord::Base
  attr_accessible :hash, :password_hash, :url
  has_many :clicks
end
