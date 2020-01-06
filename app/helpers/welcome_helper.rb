module WelcomeHelper

    def main_col
        content_tag :div, class:main_col_class do
            yield
        end
    end

    def main_col_class
        "col-md-8"
    end

    def welcome_card_body
        "card-body bg-transparent p-0 text-light  form-transparent"
    end

    def welcome_message
        "list-group-item border-0 px-5 text-center custom-bg-t"
    end

    def social_message
        "list-group-item border-0 px-5 d-flex align-items-center justify-content-center text-primary mt-0"
    end

    def welcome_card_title
        "card-subtitle display-4"
    end

    def welcome_options
        "list-group-item py-4 text-center custom-bg-t border-0"
    end

    def welcome_options_container
        "col-lg-5 align-items-center d-flex justify-content-center m-auto flex-wrap"
    end

    def social_options
        "list-group text-light d-flex justify-content-center"
    end

    def social_options_container
        "list-group-item custom-bg-t col text-center border-0"
    end

    def welcome_options_button
        "btn btn-lg send-btn custom-login-button btn-block "
    end

    def welcome_card_footer
        "card-footer bg-transparent text-center p-0 border-0"
    end

    def h4_welcome_class
        "display-4"
    end
end
