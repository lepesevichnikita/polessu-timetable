class TeachersRepository
  # Get all teachers if query not passed
  # @param params [Hash] params for select
  def self.all(params)
    res = Teacher.all
    res = search(query) if query
    res
  end

  def self.find(params)
    Teacher.find(params[:id]) if params && params[:id]
  end

  # Get teachers by full-text-search query
  # @param query [String] query for searching
  def self.search(query)
    Teacher.full_text_search(query)
  end
end
