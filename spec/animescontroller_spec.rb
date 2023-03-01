require 'rails_helper.rb'
describe AnimesController, type: :controller do

    fixtures :all
    it "Should give me two anime from fixtures" do
        user = users(:one)
        sign_in user
        get :index
        expect(assigns(:animes).size).to eql(2)
    end

    #Default
    context "with Default privileges" do
        before :each do
            user = users(:one)
            sign_in user
        end
        
        #Create
        it "should not create animes" do
            params = {:anime=>{:title => "Title", :author =>"Director", :release_date => "2021-07-09"}}
            get :create, :params => params
            a_tst = Anime.where(:title => "Title")
            expect(a_tst).to be_empty
        end

        #Retrive
        it "should retrive animes" do
            ani = animes(:one)
            params = {:id => ani.id}
            get :show, :params => params
            expect(assigns(:anime)).to eql(ani)

        end

        #Update
        it "should not update animes" do
            ani = animes(:one)
            params = {:id => ani.id, :anime=>{:title => "Test"}}
            get :update, :params => params
            a_tst = Anime.find(ani.id)
            expect(a_tst.title).to eql(ani.title)
        end

        #Destroy
        it "should not destroy anime" do
                ani = animes(:one)
                params = {:id => ani.id}
                get :destroy, :params => params
                a_tst = Anime.where(:id => ani.id)
                expect(a_tst).not_to be_empty 
        end

    
    end

    #Mod
    context "with Moderator privileges" do
        before :each do
            mod = users(:two)
            sign_in mod
        end
        
        #Create
        it "should create animes" do
            params = {:anime=>{:title => "Title", :author =>"Director", :release_date => "2021-07-09"}}
            get :create, :params => params
            a_tst = Anime.where(:title => "Title")
            expect(a_tst).not_to be_empty
        end

        #Retrive
        it "should retrive animes" do
            ani = animes(:one)
            params = {:id => ani.id}
            get :show, :params => params
            expect(assigns(:anime)).to eql(ani)

        end

        #Update
        it "should update animes" do
            ani = animes(:one)
            params = {:id => ani.id, :anime=>{:title => "Test"}}
            get :update, :params => params
            a_tst = Anime.find(ani.id)
            expect(a_tst.title).to eql("Test")
        end

        #Destroy
        it "should destroy anime" do
            ani = animes(:one)
            params = {:id => ani.id}
            get :destroy, :params => params
            a_tst = Anime.where(:id => ani.id)
            expect(a_tst).to be_empty 
        end
    
    end
    
    
end