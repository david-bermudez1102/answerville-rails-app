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
        "card-body bg-transparent p-0 custom-text-primary m-0"
    end

    def welcome_message
        "list-group-item border-0 text-center bg-transparent"
    end

    def social_message
        "list-group-item border-0 d-flex align-items-center justify-content-center mt-0"
    end

    def welcome_card_title
        "card-subtitle display-4"
    end

    def welcome_options
        "list-group-item py-4 text-center bg-transparent border-0"
    end

    def welcome_options_container
        "col-sm-7 align-items-center d-flex justify-content-center m-auto flex-wrap"
    end

    def social_options
        "list-group d-flex justify-content-center"
    end

    def social_options_container
        "list-group-item bg-transparent col text-center border-0"
    end

    def welcome_options_button
        "btn btn-lg btn-primary btn-block rounded-pill shadow"
    end

    def welcome_card_footer
        "card-footer bg-transparent text-center p-0 border-0"
    end

    def h4_welcome_class
        "display-4"
    end

    def facebook_button
        "btn rounded-circle btn-md btn-primary custom-login-button shadow"
    end

    def google_button
        "btn rounded-circle btn-md btn-danger shadow"
    end

    def github_button
        "btn rounded-circle btn-md btn-secondary shadow"
    end
end
