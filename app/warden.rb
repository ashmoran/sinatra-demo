# Copied and pasted from somewhere on the interweb

Warden::Manager.serialize_into_session do |user|
   user.id
end

Warden::Manager.serialize_from_session do |id|
  User.get(id)
end
 
Warden::Manager.before_failure do |env,opts|
  # Sinatra is very sensitive to the request method
  # since authentication could fail on any type of method, we need
  # to set it for the failure app so it is routed to the correct block
  env['REQUEST_METHOD'] = "POST"
end
 
Warden::Strategies.add(:password) do
  def valid?
    params["email"] || params["password"]
  end
 
  def authenticate!
    u = User.authenticate(params["email"], params["password"])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end
