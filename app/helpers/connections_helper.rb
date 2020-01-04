module ConnectionsHelper
  def following_card_title(user)
    if user==current_user
      "People you are following"
    else
      capture do
        concat "People "
        concat link_to(user.username, user, class:'card-link text-light') + " is following"
      end
    end
  end

  def following_title(user)
    if user==current_user
      "People you are following"
    else
      "People #{user.username} is following"
    end
  end

  def followers_card_title(user)
    if user==current_user
      "Your Followers"
    else
      link_to(user.username, user, class:'card-link text-light')+" Followers"
    end
  end

  def followers_title(user)
    if user==current_user
      "Your Followers"
    else
      "#{user.username} Followers"
    end
  end

  def connections_card_body
    "card-body align-items-center text-center custom-bg-t"
  end

  def connections_ul
    "list-group text-light"
  end

  def connections_li
    "list-group-item custom-bg-t text-light border-0"
  end

  def no_connections_li
    "list-group-item bg-transparent text-light border-0"
  end

  def display_connected_user(user)
     "#{user.name} - #{user.username}"
  end

  def not_following_anyone(user)
        if user!=current_user
            content_tag :h4, class:"text-light" do
                "#{user.name} is not following anyone yet. Try suggesting them to follow you!"
            end
        else
            content_tag :h4, class:"text-light" do
                "Not following anyone yet. Start following people to make @nswerville more fun!"
            end
        end
    end

    def no_followers(user)
        if user!=current_user
          capture do 
            concat content_tag :h4, "#{user.name} has no followers yet. Be the first one to follow them!", class:"text-light" 
            concat content_tag :div, render(partial:'followers/form', locals:{user:user}), class:"col-sm-5 m-auto"
          end
        else
            content_tag :h4, class:"text-light" do
                "No Followers yet. Try asking more questions to get more followers and make @nswerville more fun!"
            end
        end
    end

    def render_connections_img(user)
        if user.image
           image_tag(user.image, class:"circular--square", size:"50x50") 
        else
            content_tag :i, nil, class:"fa fa-user", "aria-hidden":true, style:"font-size: 50px;"
        end
    end
end
