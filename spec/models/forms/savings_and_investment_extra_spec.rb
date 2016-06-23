require 'rails_helper'

RSpec.describe Forms::SavingsAndInvestmentExtra, type: :model do
  let(:over_61) { true }
  let(:amount) { nil }

  subject(:form) { described_class.new(over_61: over_61, amount: amount) }

  describe 'validations' do
    describe 'over_61' do
      let(:amount) { 4500 }

      context 'when false' do
        let(:over_61) { false }

        it { is_expected.to be_valid }
      end

      context 'when true' do
        let(:over_61) { true }

        it { is_expected.to be_valid }
      end

      context 'when not set' do
        let(:over_61) { nil }

        it { is_expected.to be_invalid }
      end

      context 'when something else than true or false' do
        let(:over_61) { 'something' }

        it { is_expected.to be_invalid }
      end
    end

    describe 'amount' do
      context 'when over_61 is false' do
        let(:over_61) { false }

        context 'when no amount set' do
          let(:amount) { nil }

          it { is_expected.to be_invalid }
        end

        context 'when the amount is set' do
          context 'when below the minimum threshold' do
            let(:amount) { 2999 }

            it { is_expected.to be_invalid }
          end

          context 'when above the maximum threshold' do
            let(:amount) { 16000 }

            it { is_expected.to be_invalid }
          end

          context 'when within the thresholds' do
            let(:amount) { 11000 }

            it { is_expected.to be_valid }
          end
        end
      end

      context 'when over_61 is true and no amount is set' do
        let(:over_61) { true }
        let(:amount) { nil }

        it { is_expected.to be_valid }
      end

      context 'when over_61 is not set' do
        let(:over_61) { nil }
        let(:amount) { nil }

        it { is_expected.to be_invalid }
      end
    end
  end

  describe '#export' do
    subject { form.export }

    context 'when over_61 is true' do
      it 'returns hash with over_61 parameter true' do
        is_expected.to eql(over_61: true)
      end
    end

    context 'when over_61 is false' do
      let(:over_61) { false }
      let(:amount) { 4000 }

      it 'returns hash with over_61 parameter false and amount parameter set' do
        is_expected.to eql(over_61: false, amount: amount)
      end
    end
  end
end
