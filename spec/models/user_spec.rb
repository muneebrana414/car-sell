RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:vehicles) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :phone_number }
  end

  describe '#find_for_database_authentication' do
    
    context 'with email' do

      context 'return user' do
        let!(:user) { FactoryBot.create(:user) }
  
        it 'return user if user found' do
          authenticate_user = User.find_for_database_authentication({login: user.email})
  
          expect(authenticate_user).to eq user
        end
      end
  
      context 'return nil' do
        let!(:user) { FactoryBot.build(:user) }
  
        it 'return nil if user not found' do
          authenticate_user = User.find_for_database_authentication({login: user.email})
  
          expect(authenticate_user).to be_nil
        end
      end

    end

    context 'with phone_number' do
      context 'return user' do
        let!(:user) { FactoryBot.create(:user) }
  
        it 'return user if user found' do
          authenticate_user = User.find_for_database_authentication({login: user.phone_number})
  
          expect(authenticate_user).to eq user
        end
      end
  
      context 'return nil' do
        let!(:user) { FactoryBot.build(:user) }
  
        it 'return nil if user not found' do
          authenticate_user = User.find_for_database_authentication({login: user.phone_number})
  
          expect(authenticate_user).to be_nil
        end
      end
    end

  end
end

