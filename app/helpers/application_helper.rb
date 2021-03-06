module ApplicationHelper
  def reference(user)
    user != current_user ? link_to("@#{user.username}", user, class: 'm-0 card-link custom-color') : link_to('you', user, class: 'm-0 card-link custom-color')
  end

  def have?(user)
    user != current_user ? 'has' : 'have'
  end

  def display_date(d)
    d.strftime('%A, %B %d, %Y')
  end

  def display_time(d)
    d.strftime('%I:%M %p')
  end

  def title(text)
    content_for :title, text
  end

  def body_container_class
    'container-fluid d-flex flex-column min-vh-100'
  end

  def main_class
    'row flex-grow-1 align-items-center justify-content-center bg-transparent py-4'
  end

  def footer_class
    'page-footer row bg-light'
  end

  def navbar_class
    'row navbar navbar-expand-lg navbar-dark align-items-center sticky-top solid '
  end

  def navbar_brand
    'navbar-brand display-1 logo h-100 py-0  m-0'
  end

  def navbar_ul
    'navbar-nav'
  end

  def navbar_li(path)
    "nav-item my-auto #{active_page(path)}"
  end

  def navbar_link
    'nav-link'
  end

  def navbar_dropdown_divider
    content_tag :div, nil, class: 'dropdown-divider'
  end

  def navbar_content
    'collapse navbar-collapse justify-content-end my-auto text-right'
  end

  def navbar_toggler
    content_tag :button, class: 'navbar-toggler', type: 'button', data: { toggle: 'collapse', target: '#navbarSupportedContent' }, aria: { controls: 'navbarSupportedContent', expanded: false, label: 'Toggle navigation' } do
      content_tag :span, nil, class: 'navbar-toggler-icon'
    end
  end

  def navbar_dropdown_menu
    content_tag :div, class: 'dropdown-menu', aria: { labelledby: 'navbarDropdown' } do
      yield
    end
  end

  def navbar_account_dropdown
    link_to icon('fa-user') + ' Account', '#', class: "#{navbar_link} dropdown-toggle", id: 'navbarDropdown', "role": 'button', data: { toggle: 'dropdown' }, aria: { haspopup: true, expanded: false }
  end

  def active_page(path)
    'active' if current_page?(path)
  end

  def search_button
    'btn btn-outline-light text-secondary'
  end

  def custom_class(content)
    content_for :custom_class, content
  end

  def card
    content_tag :div, class: card_class do
      yield
    end
  end

  def card_header
    content_tag :div, class: card_header_class do
      yield
    end
  end

  def cell(row_class = 'row', col_class = 'col text-center')
    content_tag :div, class: row_class do
      content_tag :div, class: col_class do
        yield
      end
    end
  end

  def card_title(*tag, icon:, label:)
    content_tag *tag, icon(icon) + "  #{label}", class: card_title_class
  end

  def card_title_class
    'card-title display-4 text-light font-title'
  end

  def card_link_class
    'card-link custom-color '
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
    'display-4'
  end

  def h3_title_class
    'card-title display-3'
  end

  def card_class
    'card custom-bg-t border-0 text-light shadow'
  end

  def card_header_class
    'card-header border-0 bg-transparent text-center text-light'
  end

  def card_footer_class
    'card-footer bg-transparent text-center text-light px-0'
  end

  def icon(class_name, title = nil)
    content_tag :i, nil, class: 'fa ' + class_name, 'aria-hidden' => true, title: title
  end

  def w_100
    content_tag :div, nil, class: 'w-100'
  end

  def render_img(user, size = nil, font = '140px')
    if user.image
      image_tag(user.image, class: 'circular--square shadow', size: size)
    else
      content_tag :i, nil, class: 'fa fa-user-circle text-shadow', "aria-hidden": true, style: "font-size: #{font};"
    end
  end

  def user_icon_link(user)
    link_to render_img(user, '50x50', '50px'), user, class: card_link_class + 'col-auto pr-3 m-0'
  end
end
