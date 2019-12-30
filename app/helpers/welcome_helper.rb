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

end
