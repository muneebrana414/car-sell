RSpec.describe Api::HomeController, type: :controller do

  describe '#index' do
    let(:user) { FactoryBot.create(:user) }
    let!(:vehicles) { FactoryBot.create_list(:vehicle, 3, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    it 'return vehicles' do
      get :index

      results = assigns(:vehicles)
      results.each_with_index do |result, index|
        expect(result.id).to eq vehicles[index].id
      end
    end
  end

  describe '#add_to_favorite' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

    before { sign_in user }
    it 'to add or remove from favorite' do
      patch :add_to_favorite, format: :js, params: {vehicle_id: vehicle.id}

      result = assigns(:vehicle)
      expect(result.id).to eq vehicle.id
    end
  end
end

