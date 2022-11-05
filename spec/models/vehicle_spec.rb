RSpec.describe Vehicle, type: :model do
  
  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :engine_capacity }
    it { is_expected.to validate_presence_of :milage }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :primary_contact }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :color }
    it { is_expected.to validate_presence_of :engine_type }
    it { is_expected.to validate_presence_of :assembly_type }
    it { is_expected.to validate_presence_of :transmission }
    it { is_expected.to validate_presence_of :currency }
  end

  describe '#required_for_step?' do
    
    context 'return true if any form-step passed' do
      
      let!(:form_steps) { ['details', 'images', 'contacts'] }
      
      it 'return true if form-step details' do
        vehicle = FactoryBot.build(:vehicle, form_step: 'details')
        
        expect(vehicle.form_step).not_to be_nil
        
        expect(form_steps).to include(vehicle.form_step)
      end
      
      it 'return true if form-step images' do
        vehicle = FactoryBot.build(:vehicle, form_step: 'images')
        
        expect(vehicle.form_step).not_to be_nil
        
        expect(form_steps).to include(vehicle.form_step)
      end
      
      it 'return true if form-step contacts' do
        vehicle = FactoryBot.build(:vehicle, form_step: 'contacts')

        expect(vehicle.form_step).not_to be_nil
        
        expect(form_steps).to include(vehicle.form_step)
      end

      it 'return false if form-step nil' do
        vehicle = FactoryBot.build(:vehicle, form_step: nil)

        expect(vehicle.form_step).to be_nil
        
        expect(form_steps).not_to include(vehicle.form_step)
      end
    end
  end
end
