class Shortener < ActiveRecord::Base
  attr_accessible :hash, :password_hash, :url
end
