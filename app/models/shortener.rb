class Shortener < ActiveRecord::Base
  attr_accessible :url_hash, :password, :url
  has_many :clicks
 
  before_save :hash_new_password, :if=> !@password.blank?
  
  def check_password(url_hash, password)
    if shortener = find_by_url_hash(url_hash)
      if BCrypt::Password.new(shortener.password + shortener.url).is_password? password
        return shortner
      end
    end
  end

  private 
  def hash_new_password
    self.password_hash =  BCrypt::Password.create(@password + @url)
  end
end
