require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :request do
  describe 'GET /api/v1/groups' do
    before { create_list :group, 10 }
    before { get api_v1_groups_path }

    it 'returns 200 http status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains a groups list' do
      expect(json).to_not be_empty
      expect(json.size).to eq(Group.all.size)
    end
  end

  describe 'GET /api/v1/groups/:id' do
    let!(:group) { create :group }

    before { get api_v1_group_path(group) }

    it 'returns 200 http status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a group' do
      expect(json).to_not be_empty
      expect(Group.find_by(json)).to eq(group)
    end
  end

  describe 'GET /api/v1/groups/search' do
    before { create_list :group, 10 }
    before { get search_api_v1_groups_path(query: Group.first.short) }

    it 'returns 200 http status' do
      expect(response).to have_http_status(:success)
    end

    it 'contains a groups list' do
      expect(json).to_not be_empty
    end
  end

  describe 'GET /api/v1/groups/:id/cards/today' do
    before { create_list :card_today, 10 }
  end
end
