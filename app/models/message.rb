class Message < ActiveRecord::Base
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,
    presence: true,
    length: { minimum: 1 }
    
  validates :email,
    presence: true,
    length: { minimum: 3, maximum: 100 },
    uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX }
    
  validates :content,
    presence: true,
    length: { minimum: 1, maximum: 1000 }
    
  validates :phone,
    presence: true,
    length: { minimum: 10 }
end
