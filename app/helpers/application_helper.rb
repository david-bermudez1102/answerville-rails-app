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
    
    def custom_class(content)
        content_for :custom_class, content 
    end
    
    def card
        content_tag :div, class:card_class do
            yield
        end
    end

    def card_header
        content_tag :div, class:card_header_class do
            yield
        end
    end

    def cell(row_class,col_class)
        content_tag :div, class:row_class do
            content_tag :div, class:col_class do  
                yield
            end 
        end
    end

    def card_title(*tag,icon:,label:)
        content_tag *tag, icon(icon)+"  #{label}", class:card_title_class
    end

    def card_title_class
        "card-title display-4"
    end

    def err
        content_for :err do
            yield
        end
    end

    def card_body(*args)
        content_tag :div, *args do
            yield
        end
    end

    def main_col_class(text)
        content_for :main_col_class, text
    end

    def card_footer(*args)
        content_tag :footer, *args do
            yield
        end
    end

    def ul(*args)
        content_tag :ul, *args do
            yield
        end
    end

    def li(*args)
        content_tag :li, *args do
            yield
        end
    end

    def h3_class
        "text-light display-4"
    end

    def card_class
        "card bg-transparent border-0"
    end

    def card_header_class
        "card-header text-light border-0 form-transparent text-center"
    end

    def card_footer_class
        "card-footer custom-bg-t text-center"
    end

    def icon(class_name)
        content_tag :i, nil, class:"fa "+class_name, 'aria-hidden' => true
    end

    def w_100
        content_tag :div, nil, class:"w-100"
    end
end
