module UsersHelper
    
    def form_group_class
        "form-group list-group-item border-0 px-5 form-transparent"
    end

    def label_class
        "form-label display-4 custom-form-label"
    end

    def text_field_class_rounded(o,*args)
        c = "form-control form-control-lg rounded-pill"
        if o.errors[*args].any?
            c << " is-invalid"
        end
        c
    end

    def sign_up_button_class
        "btn btn-lg send-btn"
    end

    def form_group(f, model, *field, placeholder)
        content_tag :div, class:form_group_class do
            concat f.label *field, class:label_class
            if !(field.include?(:password) || field.include?(:password_confirmation))
                concat f.text_field *field, class:text_field_class_rounded(model,*field), placeholder:placeholder
            else
                concat f.password_field *field, class:text_field_class_rounded(model,*field), placeholder:placeholder
            end
        end
    end
    
end
