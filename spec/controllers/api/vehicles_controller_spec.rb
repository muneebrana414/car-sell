RSpec.describe Api::VehiclesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  before { sign_in user }
  describe '#user_listing' do
    let!(:vehicles) { FactoryBot.create_list(:vehicle, 3, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'return user vehicles' do
      get :user_listing

      results = assigns(:vehicles)
      results.each_with_index do |result, index|
        expect(result.id).to eq vehicles[index].id
      end
    end
  end

  describe '#show' do
    let!(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'show vehicle' do
      get :show, params: {id: vehicle.id}

      result = assigns(:vehicle)
      expect(result.id).to eq vehicle.id
    end
  end

  describe '#create' do
    let(:vehicle) { FactoryBot.build(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'create vehicle' do
      post :create, params: {vehicle: {city: vehicle.city, price: vehicle.price}}

      expect(response.status).to eq 200
    end
  end

  describe '#favorite_vehicles' do

    it 'user favorite vehicle' do
      get :favorite_vehicles

      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    let!(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'update vehicle' do
      patch :update, params: {id: vehicle.id, vehicle: {price: vehicle.price}}

      expect(response.status).to eq 200
    end
  end

  describe '#destroy' do
    let!(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'destroy vehicle' do
      delete :destroy, params: {id: vehicle.id}

      expect(response.status).to eq 200
    end
  end
end
