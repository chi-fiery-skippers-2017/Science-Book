require 'rails_helper'

describe UsersController do

  let(:user) {User.create(username:"testuser", email: "test@gmail.com", role: "faculty", password:"password")}

  describe "GET #new" do

    it { should route(:get, '/users/new').to('users#new')}
    it { should route(:get, '/users').to('users#index')}
    it { should route(:get, "/users/#{user.id}/edit").to('users#edit', id: user.id)}
  end

end