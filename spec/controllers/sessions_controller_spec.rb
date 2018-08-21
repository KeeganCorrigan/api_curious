require 'rails_helper'

describe SessionsController do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth
  end

  it "should successfully create a user" do
    expect { post :create, provider: :github }.to change{ User.count }.by(1)
  end

end
