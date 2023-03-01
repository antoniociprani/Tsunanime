Canard::Abilities.for(:default) do
  can [:read], Anime
  cannot [:create, :update, :destroy], Anime
  can [:create, :read, :update], Review
  cannot [:destroy], Review
  
end
