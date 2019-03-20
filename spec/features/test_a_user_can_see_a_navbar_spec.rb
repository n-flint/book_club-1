require 'rails_helper'

RSpec.describe "As a visitor" do
    describe 'when I visit the home page' do
        it 'has a navbar' do
            visit '/'
            within '.topnav'
            expect(page).to have_link("Home")
            expect(page).to have_link("Books")
        end

        it 'can redirect to home page by clicking link' do 
            visit '/'
            click_link('Home')
            page.status_code.should be 200
            expect(current_path).to eq('/')
        end

        it 'can redirect to the books page by clicking link' do
            visit '/'
            within '.topnav'

            click_link('Books')
            page.status_code.should be 200
            expect(current_path).to eq("/books")
        end     
    end

    describe 'when I visit the books page' do
        it 'has a navbar' do
            visit '/books'
            within '.topnav'
            expect(page).to have_link("Home")
            expect(page).to have_link("Books")
        end
        
        it 'can redirect to books page by clicking link' do 
            visit '/books'
            click_link('Books')
            page.status_code.should be 200
            expect(current_path).to eq('/books')
        end

        it 'can redirect to home page by clicking link' do 
            visit '/books'
            click_link('Home')
            page.status_code.should be 200
            expect(current_path).to eq('/')
        end
    end
end