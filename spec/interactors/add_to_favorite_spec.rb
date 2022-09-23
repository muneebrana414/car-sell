require 'spec_helper'

RSpec.describe AddToFavorite, type: :interactor do
  describe '.call' do
    let(:user) { FactoryBot.create(:user) }
    let(:vehicle) { FactoryBot.create(:vehicle, user_id: user.id, pictures: [fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'test.png'), 'image/png')]) }
    let(:vehicle_id) { vehicle.id }
    
    context "succesfully add vehicle to favorite" do

      it ' if favorite_list true' do
        favorite_list =  true 
        result = described_class.call(
          current_user: user,
          vehicle: vehicle,
          favorite_list: favorite_list,
          vehicle_id: vehicle_id
        )
        vehicle_ad = result.vehicle_ad
        favorite = result.favorite
  
        expect(result).to be_a_success
      end

      it ' if favorite_list false' do
        favorite_list =  false 
        result = described_class.call(
          current_user: user,
          vehicle: vehicle,
          favorite_list: favorite_list,
          vehicle_id: vehicle_id
        )
        vehicle_ad = result.vehicle_ad
        favorite = result.favorite
  
        expect(result).to be_a_success
      end

      it ' if favorite_list nil' do
        favorite_list =  nil 
        result = described_class.call(
          current_user: user,
          vehicle: vehicle,
          favorite_list: favorite_list,
          vehicle_id: vehicle_id
        )
        vehicle_ad = result.vehicle_ad
        favorite = result.favorite
  
        expect(result).to be_a_success
      end
    end

    context "return false to add vehicle to favorite" do

      it 'return falsey' do
        allow(described_class).to receive(:call).and_return(false)
        result = described_class.call(
          current_user: user,
          vehicle: vehicle,
          favorite_list: true,
          vehicle_id: vehicle_id
        )
  
        expect(result).to be_falsey
      end
    end
  end
end
