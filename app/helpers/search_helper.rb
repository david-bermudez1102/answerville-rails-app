module SearchHelper
  def result(content)
    capture do
      concat content_tag(:li, "#{content.model_name.plural.capitalize} (#{content.count})", class:result_title_class)
      concat render(content)
    end
  end

  def results_title(users,questions,query)
    if users.empty? && questions.empty?
      content_tag :h1, "No results found for \"#{query}\". Try again!", class:h3_title_class
    else
      content_tag :h1, "Results for \"#{query}\"", class:h3_title_class
    end
  end

  def result_title_class
    "list-group-item text-light bg-transparent display-4 border-0 custom-card-title"
  end

  def search_card_body
    "card-body bg-transparent"
  end
  
  def search_ul
    "list-group text-secondary text-left"
  end

end
