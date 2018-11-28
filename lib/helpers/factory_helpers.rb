module FactoryBot
  # Mixin for factories
  class SyntaxRunner
    # @param [Mongoid::Document]  mongoid_model - Model for creating
    # @param [Hash] params - Params for models search or creating
    # @return [Mongoid::Document] - First or new models instance
    def first_or_create(mongoid_model, params = {})
      founded_documents = mongoid_model.where(params)
      res = founded_documents.first if founded_documents.count.positive?
      res ||= FactoryBot.create(symbolize(mongoid_model), params)
      res
    end

    # @param [Mongoid::Document] mongoid_document - Mongoid document
    #  for modifying
    # @return [Mongoid::Document] Updated mongoid document
    def update_days_and_weeks_for(mongoid_document, date)
      weeks_number = CardsRepositoryHelper.weeks_number_from_studying_begin_until_date(date)
      attributes = {
          daysdef: first_or_create(Daysdef, short: date.cwday),
          weeksdef: first_or_create(Weeksdef, short: weeks_number)
      }
      mongoid_document.set(attributes)
      mongoid_document
    end

    def symbolize(obj)
      obj.to_s.downcase.to_sym
    end
  end
end
