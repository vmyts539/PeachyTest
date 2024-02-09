require 'rails_helper'

RSpec.describe 'Api::V1::Books', type: :request do
  let!(:user) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:book) { create(:book, user:) }
  let!(:book_2) { create(:book) }
  let(:auth_headers) do
    Devise::JWT::TestHelpers.auth_headers(
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      },
      user
    )
  end

  let(:book_params) do
    {
      book: {
        title: 'Book Title',
        description: 'Book Description',
        user_id: user.id
      }
    }.to_json
  end

  let(:invalid_book_params) do
    {
      book: {
        title: 'Book Title',
        description: 'Book Description',
        user_id: user_2.id
      }
    }.to_json
  end

  describe 'POST /create' do
    it 'creates book' do
      expect do
        post '/api/v1/books', headers: auth_headers, params: book_params
      end.to change(Book, :count).by(1)

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(
        'data' => {
          'book' => {
            'title' => 'Book Title',
            'id' => Book.last.id,
            'description' => 'Book Description'
          }
        },
        'message' => 'Book is successfully created.',
        'status' => { 'code' => 200 }
      )
    end

    it "doesn't create book" do
      expect do
        post '/api/v1/books', headers: auth_headers, params: invalid_book_params
      end.to raise_error(CanCan::AccessDenied)
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes book' do
      expect do
        delete "/api/v1/books/#{book.id}", headers: auth_headers
      end.to change(Book, :count).by(-1)

      expect(response).to have_http_status(204)
    end

    it "doesn't delete book" do
      expect do
        delete "/api/v1/books/#{book_2.id}", headers: auth_headers
      end.to raise_error(CanCan::AccessDenied)
    end
  end
end
