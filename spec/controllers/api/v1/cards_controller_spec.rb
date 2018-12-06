require 'rails_helper'

COUNT = {
    cards: 10
}.freeze

RSpec.describe Api::V1::CardsController, type: :request do

  describe 'GET /api/v1/groups/:id/cards/today' do
    before :all do
      FactoryBot.create_list :card, COUNT[:cards], :today

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
    before :all do
      create_list :card, COUNT[:cards], :tomorrow
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
    before :all do
      create_list :card, COUNT[:cards], :this_week
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
    before :all do
      create_list :card, COUNT[:cards], :next_week
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
    before :all do
      create_list :card, COUNT[:cards], :today
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
    before :all do
      create_list :card, COUNT[:cards], :tomorrow
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
    before :all do
      create_list :card, COUNT[:cards], :this_week
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
    before :all do
      create_list :card, COUNT[:cards], :next_week
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
