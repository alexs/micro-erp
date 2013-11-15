class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  # attr_accessible :title, :body

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :role_id

  validates_presence_of :name, :surname
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_uniqueness_of :email

  def role
    case self.role_id
      when 1
        "Administrador"
      when 2
        "Capturista"
      when 3
        "Tecnico"
      when 4
        "Supervisor"
    end
  end

  def admin?
    self.role_id == 1 ? true : false
  end

  def fullname
    "#{name} #{surname}"
  end
end
