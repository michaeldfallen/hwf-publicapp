require 'rails_helper'

RSpec.describe OnlineApplicationBuilder do
  let(:session) do
    {
      'questions' =>
      {
        'marital_status' => { 'married' => true },
        'savings_and_investment' => { 'choice' => 'between' },
        'savings_and_investment_extra' => { 'over_61' => false, 'amount' => 6000 },
        'benefit' => { 'on_benefits' => true },
        'dependent' => { 'children' => true, 'children_number' => 2 },
        'fee' => { 'paid' => true, 'date_paid' => '12/12/2015' },
        'income' => { 'wages' => 300, 'partner_rent_other_property' => 250 },
        'probate' => { 'kase' => true, 'deceased_name' => 'Mr. Deceased', 'date_of_death' => '01/08/2015' },
        'claim/default' => { 'number' => true, 'identifier' => 'CL001' },
        'form_name' => { 'identifier' => 'EX47' },
        'national_insurance' => { 'number' => 'AA123456A' },
        'personal_detail' => { 'title' => 'Mrs.', 'first_name' => 'Mary', 'last_name' => 'Jones' },
        'dob' => { 'date_of_birth' => '10/03/1967' },
        'applicant_address' => { 'address' => '1 Blue Fields, Shine Town', 'postcode' => 'SH01 TW0' },
        'contact' => { 'email_option' => true, 'email' => 'mary@jones.com', 'phone_option' => false, 'post_option' => false, 'feedback_opt_in' => true }
      }
    }
  end
  # We're using the real storage here to avoid an unnecessary mocking as these are mostly value objects
  let(:storage) { Storage.new(session) }

  subject(:builder) { described_class.new(storage) }

  describe '#online_application' do
    subject { builder.online_application }

    it 'returns an online_application' do
      is_expected.to be_a(OnlineApplication)
    end

    it 'assigns the correct values to each field' do
      expect(subject.married).to be true
      expect(subject.min_threshold_exceeded).to be true
      expect(subject.max_threshold_exceeded).to be false
      expect(subject.over_61).to be false
      expect(subject.amount).to eql 6000
      expect(subject.benefits).to be true
      expect(subject.children).to eql(2)
      expect(subject.income).to eql(550)
      expect(subject.refund).to be true
      expect(subject.date_fee_paid).to eql(Date.parse('12/12/2015'))
      expect(subject.probate).to be true
      expect(subject.deceased_name).to eql('Mr. Deceased')
      expect(subject.date_of_death).to eql(Date.parse('01/08/2015'))
      expect(subject.case_number).to eql('CL001')
      expect(subject.form_name).to eql('EX47')
      expect(subject.ni_number).to eql('AA123456A')
      expect(subject.date_of_birth).to eql(Date.parse('10/03/1967'))
      expect(subject.title).to eql('Mrs.')
      expect(subject.first_name).to eql('Mary')
      expect(subject.last_name).to eql('Jones')
      expect(subject.address).to eql('1 Blue Fields, Shine Town')
      expect(subject.postcode).to eql('SH01 TW0')
      expect(subject.email_contact).to be true
      expect(subject.email_address).to eql('mary@jones.com')
      expect(subject.phone_contact).to be false
      expect(subject.post_contact).to be false
      expect(subject.feedback_opt_in).to be true
    end
  end
end
