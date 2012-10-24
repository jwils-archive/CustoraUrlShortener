class Click < ActiveRecord::Base
  belongs_to :shortener
  attr_accessible :ip_address
end
