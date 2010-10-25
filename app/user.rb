class User
  @user_records = [
    {
      :id => 1, 
      :email => "a@b.com",
      :password => "password"
    }    
  ]
  
  class << self
    def authenticate(email, password)
      return unless user = find(email)
      user if user.password == password
    end

    def find(email)
      find_user_by(:email, email)
    end
    
    def get(id)
      find_user_by(:id, id)
    end
    
    private
    
    def find_user_by(key, value)
      return unless user_record = @user_records.detect { |user| user[key] == value }
      new(user_record)
    end
  end
  
  attr_reader :id, :email, :password
  
  def initialize(attributes)
    @id = attributes[:id]
    @email = attributes[:email]
    @password = attributes[:password]
  end
end
