# frozen_string_literal: true
RSpec.describe Timeful::RelationProxy do
  subject { described_class.new(target) }

  describe '#find_each' do
    context 'when the target responds to #find_each' do
      let(:target) do
        Class.new do
          def find_each
            yield 1
          end
        end.new
      end

      it 'calls #find_each on the target' do
        expect { |block| subject.find_each(&block) }.to yield_with_args(1)
      end
    end

    context 'when the target does not respond to #find_each' do
      let(:target) do
        Class.new do
          def each
            yield 1
          end
        end.new
      end

      it 'calls #each on the target' do
        expect { |block| subject.find_each(&block) }.to yield_with_args(1)
      end
    end
  end
end
