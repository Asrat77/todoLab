require 'rails_helper'

RSpec.describe Todo, type: :model do


  attributes = [
    { title: %i[presence uniqueness] },
    { status: %i[presence] }
  ]
  include_examples('model_shared_spec', :todo, attributes)




  # it "has a valid factory" do

  #   todo = create(:todo)

  #   expect(todo).to be_valid
  # end

  # it {is_expected.to(validate_presence_of(:title))}


  # it {is_expected.to(validate_presence_of(:status))}





end
