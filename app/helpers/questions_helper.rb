module QuestionsHelper
    def text_field_class(o,*args)
        c = "form-control form-control-lg"
        if o.errors[*args].any?
            c << " is-invalid"
        end
        c
    end
end
