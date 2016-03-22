require 'rails_helper'

RSpec.describe Storage do
  subject(:storage) { described_class.new(session) }

  describe '#save_form' do
    let(:id) { 'ID' }
    let(:json_data) { { some: 'data' } }

    let(:session) { {} }
    let(:form) { double(id: id, as_json: json_data) }

    before do
      storage.save_form(form)
    end

    it 'sets the json data to the session' do
      expect(session[id]).to eql(json_data)
    end
  end

  describe '#load_form' do
    let(:id) { 'ID' }
    let(:json_data) { { some: 'data' } }

    let(:form) { double(id: id, update_attributes: nil) }

    before do
      storage.load_form(form)
    end

    context 'when the data with the form id is in the session' do
      let(:session) { { id => json_data } }

      it 'updates the form with the data' do
        expect(form).to have_received(:update_attributes).with(json_data)
      end
    end

    context 'when there is no data with the form id in the session' do
      let(:session) { {} }

      it 'updates the form with an empty hash' do
        expect(form).to have_received(:update_attributes).with({})
      end
    end
  end

  describe '#submission_result=' do
    let(:result) { double }

    let(:session) { {} }

    before do
      storage.submission_result = result
    end

    it 'stores the submission_result in the session' do
      expect(session[:submission_result]).to eql(result)
    end
  end

  describe '#submission_result' do
    let(:result) { double }

    subject { storage.submission_result }

    context 'when there is a submission_result stored in the session' do
      let(:session) { { submission_result: result } }

      it { is_expected.to eql(result) }
    end
    context 'when there is no submission_result stored in the session' do
      let(:session) { {} }

      it { is_expected.to be nil }
    end
  end
end