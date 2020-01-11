module UsersHelper

    def reference_liked_by(user)
        user != current_user ? user.username : "you"
    end

    def form_group_class
        "form-group list-group-item border-0 px-5 bg-transparent m-0"
    end

    def form_group_class_with_buttons
        " d-flex justify-content-center align-items-center flex-wrap"
    end

    def form_inline_class
        "form-inline"
    end

    def form_group_inline_class
        "form-group border-0 px-1"
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

     def text_field_inline_class_rounded(o,*args)
        c = "form-control form-control-md shadow border-0"
        if o.errors[*args].any?
            c << " is-invalid"
        end
        c
    end

    def login_button_class
        "btn btn-lg btn-primary btn-block shadow rounded-pill"
    end

    def sign_up_button_class
        "btn btn-lg btn-primary btn-block shadow rounded-pill"
    end

    def login_button_inline
        "btn btn-md btn-light shadow rounded-pill"
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

    def login_card_body
        "card-body bg-transparent text-secondary px-0 p-0"
    end

    def signup_card_body
        "card-body bg-transparent text-secondary px-0 p-0"
    end

    def user_questions_ul
        "list-group bg-transparent"
    end

    def no_user_questions_li
        "list-group-item border border-0 display-4 text-center d-flex align-items-center custom-bg-t font-30"
    end

    def user_questions_list_title
        "col py-3 display-4 text-center custom-bg-t custom_user_questions_list_title"
    end

    def user_menu_item(icon, content, *url)
        content_tag :div, class:user_menu_item_class do
            concat icon(icon)
            concat " "
            concat link_to(content, *url, class:user_menu_item_link)
        end
    end
    

    def user_menu_item_class
        "col py-2 display-4 custom-bg-t custom_user_menu_list_title"
    end

    def user_menu_item_link
        "card-link text-light"
    end

    def user_menu_title
        "card-title display-4 user-menu-title"
    end

    def follow_button
        "btn btn-lg send-btn follow_button"
    end

    def content_liked_header_title(user)
        if user.liked.empty?
            reference_liked_by(user) + " #{have?(user)}n't liked anything yet!"
        else
            "Content "+reference_liked_by(user)+" #{have?(user)} liked"
        end
    end

    def content_liked_title(user)
        "Content "+reference_liked_by(user)+" #{have?(user)} liked"
    end

    def content_liked_by(user, content)
        capture do
            concat reference_liked_by(user)
            concat " "
            concat " liked the #{content.type.capitalize} " 
            concat content_tag(:cite, content_tag(:small,content.content))
            concat " by "
            concat content_tag(:cite, content_tag(:small,content.user.username))
        end
    end

    def liked_ul
        "list-group bg-transparent custom-text-primary"
    end
    
    def liked_li
        "list-group-item display-4 liked-list justify-content-center d-flex align-items-center border-0 bg-light"
    end

    def liked_card_body
        "card-body bg-transparent custom-text-primary"
    end

    def liked_container
        "col-xl-9 p-0 d-flex align-items-center flex-wrap"
    end

    def liked_span
        "col-auto p-0 text-nowrap"
    end
end
