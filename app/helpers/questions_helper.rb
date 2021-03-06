# frozen_string_literal: true

module QuestionsHelper
  def text_field_class(o, *args)
    c = 'form-control form-control-lg'
    c << ' is-invalid' if o.errors[*args].any?
    c
  end

  def categories(content)
    categories = content.categories.map(&:name)
    categories.join(', ')
  end

  def categories_class
    'form-control form-control-lg form-group form-check form-check-inline flex-wrap text-nowrap bg-white w-100 h-100 shadow text-secondary p-2 border-0'
  end

  def question_card_body
    'card-body bg-light'
  end

  def new_question_card_body
    'card-body bg-transparent'
  end

  def questions_card_body
    'card-body bg-transparent p-0'
  end

  def questions_ul
    'list-group p-0 border-0'
  end

  def questions_li
    'list-group-item border-0 bg-transparent p-0'
  end

  def no_questions_li
    'list-group-item border-0 bg-transparent text-center text-secondary'
  end

  def question_ul
    'list-group text-secondary text-left'
  end

  def question_li
    'list-group-item border-0 bg-light mx-2 my-1 shadow rounded'
  end
end
