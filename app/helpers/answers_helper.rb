# frozen_string_literal: true

module AnswersHelper
  def no_answers
    'text-light'
  end

  def answer_ul
    'list-group text-secondary text-left'
  end

  def answer_li
    'list-group-item bg-light'
  end

  def answers_ul
    'list-group bg-transparent border-0'
  end

  def answers_li
    'list-group-item bg-light border-0 text-center'
  end

  def answered_questions_li
    'list-group-item bg-transparent'
  end

  def answer_header_title
    'card-title d-flex align-items-center'
  end

  def answer_card_body
    'card-body bg-light border-0'
  end

  def answers_card_body
    'card-body bg-transparent p-0 border-0 text-secondary'
  end

  def answers_header_title(user)
    user != current_user ? "Questions #{user.name} has answered" : 'Questions you have answered'
  end

  def wrote(user)
    user != current_user ? "@#{user.username} wrote" : 'You wrote'
  end

  def no_questions_answered(user)
    ul class: answers_ul do
      li class: answers_li do
        if user != current_user
          "#{@user.name} hasn't answered any questions yet."
        else
          link_to "You haven't answered any question yet. Click here to start answering questions", root_url, class: card_link_class
        end
      end
    end
  end
end
