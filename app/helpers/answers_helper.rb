module AnswersHelper
    def no_answers
        "text-secondary"
    end

    
    def answer_ul
       "list-group text-secondary text-left" 
    end

    def answer_li
       "list-group-item bg-light" 
    end

    def answers_ul
       "list-group-item bg-light" 
    end

    def answers_li
       "list-group-item bg-light" 
    end

    def answer_header_title
        "card-title"
    end

    def answer_card_body
        "card-body bg-light"
    end

    def answers_card_body
        "card-body bg-transparent p-0"
    end

    def answers_header_title(user)
        user != current_user ? "Questions #{user.name} has answered" : "Questions you have answered"
    end

    def wrote(user)
        user != current_user ? "#{user.username} wrote" : "You wrote"
    end
end
