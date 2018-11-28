require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :request do
  CARDS_NUMBER = 10
  describe 'GET /api/v1/groups/:id/cards/today' do
    before do
      create_list :card, CARDS_NUMBER, :today
      get api_v1_group_cards_path(
              group_id: Group.first.id,
              definition: :day,
              period: :today
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/groups/:id/cards/tomorrow' do
    before do
      create_list :card, CARDS_NUMBER, :tomorrow
      get api_v1_group_cards_path(
              group_id: Group.first.id,
              definition: :day,
              period: :tomorrow
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end

  end

  describe 'GET /api/v1/groups/:id/cards/this_week' do
    before do
      create_list :card, CARDS_NUMBER, :this_week
      get api_v1_group_cards_path(
              group_id: Group.first.id,
              definition: :week,
              period: :this
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/groups/:id/cards/next_week' do
    before do
      create_list :card, CARDS_NUMBER, :next_week
      get api_v1_group_cards_path(
              group_id: Group.first.id,
              definition: :week,
              period: :next
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/teachers/:id/cards/today' do
    before do
      create_list :card, CARDS_NUMBER, :today
      get api_v1_teacher_cards_path(
              teacher_id: Teacher.first.id,
              definition: :day,
              period: :today
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/teachers/:id/cards/tomorrow' do
    before do
      create_list :card, CARDS_NUMBER, :tomorrow
      get api_v1_teacher_cards_path(
              teacher_id: Teacher.first.id,
              definition: :day,
              period: :tomorrow
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/teachers/:id/cards/this_week' do
    before do
      create_list :card, CARDS_NUMBER, :this_week
      get api_v1_teacher_cards_path(
              teacher_id: Teacher.first.id,
              definition: :week,
              period: :this
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/teachers/:id/cards/next_week' do
    before do
      create_list :card, CARDS_NUMBER, :next_week
      get api_v1_teacher_cards_path(
              teacher_id: Teacher.first.id,
              definition: :week,
              period: :next
          )
    end

    it 'returns 200 https status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains cards' do
      expect(json).to_not be_empty
    end
  end
end
