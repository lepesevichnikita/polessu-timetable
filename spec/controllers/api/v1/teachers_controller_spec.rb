require 'rails_helper'

RSpec.describe Api::V1::TeachersController, type: :request do
  describe 'GET /api/v1/teachers' do
    before { create_list :teacher, 10 }
    before { get '/api/v1/teachers' }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns teachers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(Teacher.all.size)
    end
  end

  describe 'GET /api/v1/teachers/:id' do
    let!(:teacher) { create :teacher }

    before { get "/api/v1/teachers/#{teacher.id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns teacher' do
      expect(json).not_to be_empty
      expect(Teacher.find_by(json)).to eq(teacher)
    end
  end

  describe 'GET /api/v1/teachers/search' do
    let!(:teachers) { create_list :teacher, 10 }

    before { get search_api_v1_teachers_path(query: teachers.first.name) }

    it 'returns status code 200' do
      expect(json).not_to be_empty
    end
  end
end
