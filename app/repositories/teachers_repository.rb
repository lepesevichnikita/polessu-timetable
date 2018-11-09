class TeachersRepository
  def self.all(query = nil)
    res = Teacher.all
    res = search(query) if query
    res
  end

  def self.find(params)
    Teacher.find(params[:id])
  end

  def self.search(query)
    Teacher.full_text_search(query)
  end
end
