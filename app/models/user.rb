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
  after_update :save_careers
  
  private 
    def save_careers
      career_list.delete('0')
      return UserCareer.where(user_id: self.id).destroy_all if career_list.nil? || career_list.empty?
      
      UserCareer.where.not(career_id: career_list).where(user_id: self.id).destroy_all

      career_list.each do |career_id|
        UserCareer.find_or_create_by(career_id: career_id, user_id: self.id)
      end
    end
end
