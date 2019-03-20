require 'rails_helper'

RSpec.describe Review, type: :model do
    describe 'validations' do
        it { should validate_presence_of :heading}
        it { should validate_presence_of :score}
        it { should validate_presence_of :full_review}
        it { should validate_presence_of :username}
        it { should validate_presence_of :book_id}
    end

    describe 'relationships' do
        it { should belong_to :book}
    end

end