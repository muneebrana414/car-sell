RSpec.describe Api::AuthenticationController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  describe '#create' do

    it 'create auth' do
      post :create, params: {user: {login: user.email, password: user.password}}

      expect(response.status).to eq 200
    end
  end

  describe '#destroy' do

    it 'destroy auth' do
      sign_in user
      delete :destroy

      expect(response.status).to eq 200
    end
  end
end
