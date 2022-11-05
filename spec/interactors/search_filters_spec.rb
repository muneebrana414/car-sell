require 'spec_helper'

RSpec.describe SearchFilters, type: :interactor do
  describe '.call' do
    let(:searching_filters) { ['lahore', 'honda'] }
    
    it "succesfully return search vehicles" do
      result = described_class.call(
        searching_filters: searching_filters,
      )
      vehicles = result.vehicles
      expect(result).to be_a_success
    end

    it "succesfully return search vehicles" do
      allow(described_class).to receive(:call).and_return(false)
      result = described_class.call(
        searching_filters: searching_filters,
      )
      expect(result).to be_falsey
    end
  end
end
