require 'rails_helper'

RSpec.describe 'new book workflow' do
  it "creates a new book when form is filled and submitted" do
    visit books_path
    click_link "Add book"
  end
end
