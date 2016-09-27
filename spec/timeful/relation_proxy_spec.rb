# frozen_string_literal: true
RSpec.describe Timeful::RelationProxy do
  subject { described_class.new(object) }

  describe '#find_each' do
    context 'when the object responds to #find_each' do
      let(:object) do
        Class.new do
          def find_each
            yield 1
          end
        end.new
      end

      it 'calls #find_each on the object' do
        expect { |block| subject.find_each(&block) }.to yield_with_args(1)
      end
    end

    context 'when the object does not respond to #find_each' do
      let(:object) do
        Class.new do
          def each
            yield 1
          end
        end.new
      end

      it 'calls #each on the object' do
        expect { |block| subject.find_each(&block) }.to yield_with_args(1)
      end
    end
  end
end
