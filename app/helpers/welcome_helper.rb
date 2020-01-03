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
        "card-body bg-transparent p-0 text-light"
    end

    def welcome_message
        "list-group-item border-0 px-5 text-center custom-bg-t"
    end

    def welcome_card_title
        "card-subtitle display-4"
    end

    def welcome_options
        "list-group-item py-4 text-center custom-bg-t"
    end

    def welcome_options_container
        "col-lg-5 align-items-center d-flex justify-content-between m-auto"
    end

    def welcome_options_button
        "btn btn-lg send-btn follow_button"
    end
end
