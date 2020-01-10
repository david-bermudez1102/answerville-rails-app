module QuestionsHelper
    def text_field_class(o,*args)
        c = "form-control form-control-lg"
        if o.errors[*args].any?
            c << " is-invalid"
        end
        c
    end

    def categories(content)
        categories = content.categories.map do |category|
            category.name
        end
        categories.join(", ")
    end

    def question_card_body
        "card-body bg-light"
    end

    def new_question_card_body
        "card-body bg-transparent"
    end

    def questions_card_body
        "card-body bg-transparent p-0"
    end

    def questions_ul
        "list-group p-0 border-0"
    end

    def questions_li
        "list-group-item border-0 bg-transparent p-0"
    end

    def no_questions_li
        "list-group-item border-0 transparent text-center"
    end

    def question_ul
        "list-group text-secondary text-left"
    end

    def question_li
        "list-group-item bg-light border-0 mb-1 shadow"
    end
end
