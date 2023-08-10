require 'rails_helper'

RSpec.describe "/todos", type: :request do

  include_examples('request_shared_spec', 'todos', 3)

  let(:valid_attributes) do {
    title: Faker::Lorem.word,
    status: Faker::Lorem.word,
    date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31')

  } end

  let(:invalid_attributes) do {
    title: nil,
    status: Faker::Lorem.word,
    date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31')

  } end


  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Todo.create! valid_attributes
  #     get todos_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     todo = Todo.create! valid_attributes
  #     get todo_url(todo)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_todo_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /edit" do
  #   it "renders a successful response" do
  #     todo = Todo.create! valid_attributes
  #     get edit_todo_url(todo)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Todo" do
  #       expect {
  #         post todos_url, params: { todo: valid_attributes }
  #       }.to change(Todo, :count).by(1)
  #     end

  #     it "redirects to the created todo" do
  #       post todos_url, params: { todo: valid_attributes }
  #       expect(response).to redirect_to(todo_url(Todo.last))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new Todo" do
  #       expect {
  #         post todos_url, params: { todo: invalid_attributes }
  #       }.to change(Todo, :count).by(0)
  #     end


  #     it "renders a response with 422 status (i.e. to display the 'new' template)" do
  #       post todos_url, params: { todo: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end

  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) do {

  #     title: Faker::Lorem.word


  #     } end

  #     it "updates the requested todo" do
  #       todo = create(:todo)
  #       expect(todo.title).not_to eq new_attributes[:title]
  #       patch todo_url(todo), params: {todo: new_attributes},  as: :json
  #       todo.reload
  #       expect(todo.title).to eq new_attributes[:title]
  #     end

  #     it "redirects to the todo" do
  #       todo = Todo.create! valid_attributes
  #       patch todo_url(todo), params: { todo: new_attributes }
  #       todo.reload
  #       expect(response).to redirect_to(todo_url(todo))
  #     end
  #   end

  #   context "with invalid parameters" do

  #     it "renders a response with 422 status (i.e. to display the 'edit' template)" do
  #       todo = Todo.create! valid_attributes
  #       patch todo_url(todo), params: { todo: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end

  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested todo" do
  #     todo = Todo.create! valid_attributes
  #     expect {
  #       delete todo_url(todo)
  #     }.to change(Todo, :count).by(-1)
  #   end

  #   it "redirects to the todos list" do
  #     todo = Todo.create! valid_attributes
  #     delete todo_url(todo)
  #     expect(response).to redirect_to(todos_url)
  #   end
  # end
end
