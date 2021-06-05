class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_careers
  has_many :careers, through: :user_careers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :career_list
  after_create :save_careers
  
  
  private 
    def save_careers
      puts 11111111
      puts career_list
      puts self.id
      career_list.each do |career_id|
        next if career_id == 0 || career_id == '0'
        UserCareer.find_or_create_by(career_id: career_id, user_id: self.id)
      end
    end
end
