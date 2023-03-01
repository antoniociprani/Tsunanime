Canard::Abilities.for(:admin) do
    can [:read, :create, :update, :destroy], Anime
    can [:read, :create, :update, :destroy], Review
    can [:update], User
    
  end