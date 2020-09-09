require 'rails_helper'

RSpec.describe 'POST api/comments', type: :request do
  let!(:user) { create(:user)}
  let!(:user_credentials) { user.create_new_auth_token }
  let!(:user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

  let!(:article) { create(:article)}

  describe 'POST api/comments' do
    before do
      post '/api/comments',
      params: {
        comment: {
          body: 'This is me commenting an article',
          article_id: article.id
        }
      }, headers: user_headers
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return success message' do
      expect(response_json['message']).to eq 'Your comment was submitted successfully!'
    end
  end
end