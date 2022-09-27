RSpec.describe StepsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }  
  let!(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }

  before { sign_in user }
  describe '#show' do
    it 'render wizard form step details' do
      get :show, params: { vehicle_id: vehicle.id, id: "details" } 

      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    it 'render wizard form step details' do
      put :update, params: { vehicle_id: vehicle.id, id: "details", vehicle: {city: vehicle.city} } 

      expect(response.body).to redirect_to("http://test.host/vehicles/#{vehicle.id}/steps/images")
    end

    it 'render wizard form step images' do
      put :update, params: { vehicle_id: vehicle.id, id: "images", vehicle: {pictures: vehicle.pictures} } 

      expect(response.body).to redirect_to("http://test.host/vehicles/#{vehicle.id}/steps/contacts")
    end

    it 'render wizard form step contacts' do
      put :update, params: { vehicle_id: vehicle.id, id: "contacts", vehicle: {primary_contact: vehicle.primary_contact} } 

      expect(response.body).to redirect_to("http://test.host/vehicles/#{vehicle.id}/steps/wicked_finish")
    end
  end
end

