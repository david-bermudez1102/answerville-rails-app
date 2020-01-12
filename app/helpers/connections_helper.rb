module ConnectionsHelper
  def following_card_title(user)
    capture do
        concat "People "
        concat reference(user)
        user==current_user ? concat(" are following") : concat(" is following")
    end
  end

  def following_title(user)
    if user==current_user
      "People you are following"
    else
      "People @#{user.username} is following"
    end
  end

  def followers_card_title(user)
    if user==current_user
      "Your Followers"
    else
      link_to("@#{user.username}", user, class:'card-link custom-color')+" Followers"
    end
  end

  def followers_title(user)
    if user==current_user
      "Your Followers"
    else
      "@#{user.username} Followers"
    end
  end

  def connections_card_body
    "card-body align-items-center text-center bg-transparent text-secondary"
  end

  def connections_ul
    "list-group custom-color d-flex justify-content-center"
  end

  def connections_li
    "list-group-item border-0 bg-light my-2 col-xl-7 rounded-pill d-flex flex-wrap justify-content-center"
  end

  def no_connections_li
    "list-group-item bg-light custom-color border-0"
  end

  def display_connected_user(user)
     "#{user.name} - @#{user.username}"
  end

  def not_following_anyone(user)
        if user!=current_user
            content_tag :h4, "#{user.name} is not following anyone yet. Try suggesting them to follow you!"
        else
            content_tag :h4, "Not following anyone yet. Start following people to make @nswerville more fun!"
        end
    end

    def no_followers(user)
        if user!=current_user
          capture do 
            concat content_tag :h4, "#{user.name} has no followers yet. Be the first one to follow them!", class:"" 
            concat content_tag :div, render(partial:'followers/form', locals:{user:user}), class:"col-sm-5 m-auto"
          end
        else
          content_tag :h4, "No Followers yet. Try asking more questions to get more followers and make @nswerville more fun!"
        end
    end
end
