require 'active_support'

module SingleModelRepository
  MODEL_NAME_SEPARATOR = 'Repository'.freeze

  # Base class for repository, that should provide functional
  #  for single model
  class Base

    # Return model name, based on repository name
    #  'Models<Separator>'
    def self.model_name
      model_name = name.split(MODEL_NAME_SEPARATOR).first
      raise 'Class name should contains Repository' unless model_name
    end

    def self.model
      model_name.singularize.constantize
    end

    # Get all records if query not passed
    # @param params [Hash] params for select
    def self.all(params)
      res = model.all
      res = search(params[:query]) if params && params[:query]
      res
    end

    # Find records by params
    # @param params [Hash] params for model getting
    def self.find_by(params)
      model.find(params[:id]) if params && params[:id]
    end

    # Find records by full-text-search query
    # @param query [String] query for searching
    def self.search(query, params={})
      model.full_text_search(query)
    end
  end
end
