class ArticleSearch 
  def self.results(query)
    instance = new(query)
    instance.results
  end

  def initialize(query)
    @query = Article.sanitize_sql_like(query)
  end

  def results
    Article.where("title ILIKE ?", "%#{@query}%")
           .or(Article.where("body ILIKE ?", "%#{@query}%"))
  end
end