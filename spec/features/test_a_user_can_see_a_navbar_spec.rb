require 'rails_helper'

RSpec.describe "As a visitor" do
    describe 'when I visit the home page' do
        it 'has a navbar' do
            visit root_path
            within '.topnav'
            expect(page).to have_link("Home")
            expect(page).to have_link("Books")
        end

        it 'can redirect to home page by clicking link' do 
            visit root_path
            click_link('Home')
            page.status_code.should be 200
            expect(current_path).to eq(root_path)
        end

        it 'can redirect to the books page by clicking link' do
            visit root_path
            within '.topnav'

            click_link('Books')
            page.status_code.should be 200
            expect(current_path).to eq(books_path)
        end     
    end

    describe 'when I visit the books page' do
        it 'has a navbar' do
            visit books_path
            within '.topnav'
            expect(page).to have_link("Home")
            expect(page).to have_link("Books")
        end
        
        xit 'can redirect to books page by clicking link' do 
            visit books_path
            click_link('Books')
            page.status_code.should be 200
            expect(current_path).to eq(books_path)
        end

        xit 'can redirect to home page by clicking link' do 
            visit books_path
            click_link('Home')
            page.status_code.should be 200
            expect(current_path).to eq(root_path)
        end
    end
end