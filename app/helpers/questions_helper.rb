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

end
