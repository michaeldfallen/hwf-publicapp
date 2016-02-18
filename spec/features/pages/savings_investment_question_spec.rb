# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "savings-and-investment" page for "Help with fees"' do
    before { page.visit '/savings-and-investment' }

    context 'completing the form correctly' do
      before do
        choose 'savings_and_investment_less_than_limit_true'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "benefits" page' do
        expect(page).to have_content 'Do you receive any of the following benefits?'
      end
    end

    context 'not completing the page correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect to be shown the "savings-and-investment" page with error block' do
        expect(page).to have_content 'You need to fix the errors on this page before continuing.'
      end

      scenario 'I expect the fields to have specific errors' do
        expect(page).to have_xpath('//span[@class="error-message"]', text: 'Select a savings answer')
      end
    end
  end
end