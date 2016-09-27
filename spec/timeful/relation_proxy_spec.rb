# frozen_string_literal: true
RSpec.describe Timeful::RelationProxy do
  describe '#find_each' do
    context 'when the object responds to #find_each' do
      it 'calls #find_each on the object'
    end

    context 'when the object does not respond to #find_each' do
      it 'calls #each on the object'
    end
  end
end
