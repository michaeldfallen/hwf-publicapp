class OnlineApplication
  include Virtus.model(nullify_blank: true)

  attribute :married, Boolean
  attribute :threshold_exceeded, Boolean
  attribute :benefits, Boolean
  attribute :children, Integer
  attribute :income, Integer
  attribute :refund, Boolean
  attribute :date_fee_paid, Date
  attribute :probate, Integer
  attribute :deceased_name, String
  attribute :date_of_death, Date
  attribute :case_number, String
  attribute :form_name, String
  attribute :ni_number, String
  attribute :date_of_birth, Date
  attribute :title, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :postcode, String
  attribute :email_contact, Boolean
  attribute :email_address, String
  attribute :phone_contact, Boolean
  attribute :phone, String
  attribute :post_contact, Boolean
  attribute :feedback_opt_in, Boolean
end