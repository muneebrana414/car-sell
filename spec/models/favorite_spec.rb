RSpec.describe Favorite, type: :model do
  
  describe 'Associations' do
    it { should belong_to(:favoritable) }
    it { should belong_to(:favoritor) }
  end

  # describe '#block!' do
  #   let(:favorite) { create(:favorite) }

  #   it 'return true if this' do

  #     expect(favorite.block!).to eq true
  #   end
  # end
end
