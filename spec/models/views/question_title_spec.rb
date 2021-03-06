require 'rails_helper'

RSpec.describe Views::QuestionTitle do
  subject(:service) { described_class.new(form, online_application) }

  describe '#i18n_title' do
    let(:form) { double(id: id) }
    let(:online_application) { build(:online_application) }

    subject { service.i18n_title }

    context 'for the savings_and_investment_extra question' do
      let(:id) { 'savings_and_investment_extra' }

      context 'when the online_application says the user is married' do
        let(:online_application) { build(:online_application, married: true) }

        it { is_expected.to eql('text_married') }
      end

      context 'when the online_application says the user is single' do
        let(:online_application) { build(:online_application, married: false) }

        it { is_expected.to eql('text_single') }
      end
    end

    context 'for other questions' do
      let(:id) { 'benefit' }

      it { is_expected.to eql('text') }
    end
  end
end
