module ApplicationHelper
    def title(text)
        content_for :title, text
    end

    def body_container_class
        "container-fluid d-flex flex-column min-vh-100"
    end

    def main_class
        "row flex-grow-1 align-items-center justify-content-center bg-transparent py-4"
    end

    def footer_class
        "page-footer row bg-light"
    end

    def navbar_class
        "col navbar navbar-expand-lg navbar-dark bg-transparent shadow scrolling-navbar align-items-center"
    end
    
    def card_title
        content_for :card_title do
            yield
        end
    end

    def err
        content_for :err do
            yield
        end
    end

    def col_size(text)
        content_for :col_size, text
    end
end
