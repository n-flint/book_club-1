require 'rails_helper'

RSpec.describe Book, type: :model do
    describe "validations" do
        it { should validate_presence_of :title}
        it { should validate_presence_of :page_count}
        it { should validate_presence_of :pub_year}
        it { should validate_presence_of :thumbnail_url}
    end

    describe "relationships" do
        it { should have_many :reviews}
        it { should have_many(:authors).through(:bookauthors)}
    end
end