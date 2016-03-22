require 'rails_helper'

RSpec.feature 'User submits their application' do
  let(:reference) { 'HWF-CIDI16' }

  scenario 'User submits their application and it is successfully processed' do
    given_user_provides_all_data
    and_the_submission_service_is_available(reference)
    when_they_submit_the_application
    then_they_are_presented_with_the_confirmation_page_with_reference_number
  end

  scenario 'User submits their application, but it is not processed' do
    given_user_provides_all_data
    and_the_submission_service_is_unavailable
    when_they_submit_the_application
    then_they_are_redirected_to_the_summary_page_with_error_message
  end

  def then_they_are_presented_with_the_confirmation_page_with_reference_number
    expect(page.current_path).to eql('/submission')
    expect(page).to have_content(reference)
  end

  def then_they_are_redirected_to_the_summary_page_with_error_message
    expect(page.current_path).to eql('/summary')
    expect(page).to have_text("We couldn't process your application at this time. Please try again later.")
  end
end