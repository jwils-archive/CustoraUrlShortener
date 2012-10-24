require 'bcrypt'

class Shortener < ActiveRecord::Base
  attr_accessible :url_hash, :url
  attr_accessor :password
  has_many :clicks
 
  before_save :hash_new_password
  before_save :generate_hash

  def check_password( password)
      if BCrypt::Password.new(self.password_hash).is_password? password
        return true
      end
  end

  private 
  def hash_new_password
    if @password
      self.password_hash =  BCrypt::Password.create(@password)
    end
  end


  def generate_hash
    if self.url_hash.nil?
      self.url_hash = (0...8).map{65.+(rand(26*2 + 10)).chr}.join
    end
  end
end
