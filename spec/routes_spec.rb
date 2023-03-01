require "rails_helper"

RSpec.describe 'routes', :type => :routing do
    
    #Test route /profile
    it "routes /profile to the profiles controller" do
        expect(get("/profiles")).to route_to("profiles#index")
    end

    #Test route profile edit
    it "routes /profile update to users controller" do
        expect(get("/users/edit")).to route_to("users/registration_s#edit")
    end

    #Test route /animes
    it "routes /animes to animes controller" do
        expect(get("/animes")).to route_to("animes#index")
    end

    #Test route /top5/index
    it "routes /top5/index to top5 controller" do
        expect(get("/top5/index")).to route_to("top5#index")
    end

end
