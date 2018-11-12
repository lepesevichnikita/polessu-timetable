class Api::V1::GroupsController < ApplicationController
  before_action :set_groups, only: %i[index search]
  before_action :set_group, only: %i[show]

  private

  def set_groups
    @groups = GroupsRepository.all(params)
  end

  def set_group
    @group = GroupsRepository.find_by(params)
  end

end
