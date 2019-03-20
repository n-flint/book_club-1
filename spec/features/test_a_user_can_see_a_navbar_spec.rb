require 'rails_helper'

RSpec.describe "A user visits a page" do
    describe "each page" do
        it 'has a navbar' do

            visit '/books'

            within '.topnav'

            expect(page).to have_content("Home")
            expect(page).to have_content("Books")

            visit '/'

            within '.topnav'

            expect(page).to have_content("Home")
            expect(page).to have_content("Books")
        end
    end
end