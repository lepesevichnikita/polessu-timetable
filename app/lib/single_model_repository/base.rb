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

      model_name.singularize.constantize
    end

    # Get all teachers if query not passed
    # @param params [Hash] params for select
    def self.all(params)
      res = model_name.all
      res = search(params[:query]) if params && params[:query]
      res
    end

    # Get teacher by params
    # @param params [Hash] params for teacher getting
    def self.find_by(params)
      model_name.find(params[:id]) if params && params[:id]
    end

    # Get teachers by full-text-search query
    # @param query [String] query for searching
    def self.search(query, params={})
      model_name.where(params).full_text_search(query, relevant_search: true)
    end
  end
end
