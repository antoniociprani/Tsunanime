Canard::Abilities.for(:moderator) do
  can [:create, :read, :update, :destroy], Anime
  can [:ban], User
  
end
