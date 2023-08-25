require 'rails_helper'

RSpec.describe "/todos", type: :request do

  include_examples('request_shared_spec', 'todos', 4)

  let(:valid_attributes) do {
    title: Faker::Lorem.word,
    status: Faker::Lorem.word,
    date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31')
  } end

  let(:invalid_attributes) do {
    title: nil,
    status: nil,
    date: nil

  } end

  let(:new_attributes) do {
    status: Faker::Lorem.word,
  } end

end

