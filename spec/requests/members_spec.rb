require "rails_helper"

RSpec.describe "MembersController", :type => :request do
    
    let(:team) { create(:team)}
    let(:role) { create(:role) }
    
    let(:team2) { create(:team, name: "Núcleo de Atendimento e Vendas", initials: "NAV")}
    let(:role2) {create(:role, name: "Líder de Atendimento e Vendas", team: team2)}
    let(:member) { create(:member, name: "Larissa Santana de Freitas Andrade", roles: [role2])}

    it "creates a Member" do
        headers = { "ACCEPT" => "application/json" }
        new_member = { :name => "Valentin Ferreira Paes" }
        post "/members", :params => { :member => new_member }, :headers => headers
        body = JSON.parse(response.body)
        
        expect(response.content_type).to match(/application\/json/)
        expect(response).to have_http_status(:created)
        expect(body['name']).to eq(new_member[:name])
    end

    it "shows all Members information" do 
        get "/members"

        expect(response.content_type).to match(/application\/json/)
        expect(response).to have_http_status(:ok)
    end 

    it "shows a Member's information" do 
        get "/members/#{member.id}"
        body = JSON.parse(response.body)

        expect(response.content_type).to match(/application\/json/)
        expect(response).to have_http_status(:ok)
        expect(body['name']).to eq(member.name)
    end 

    # it "updates a Member info" do
    #     headers = { "ACCEPT" => "application/json" }
    #     put "/members/#{larissa.id}", :params => { :member => {:name => "Larissinha lindinha"} }, :headers => headers
    #     body = JSON.parse(response.body)
        
    #     expect(response.content_type).to match(/application\/json/)
    #     expect(response).to have_http_status(:ok)
    #     expect(body['name']).to eq("Larissinha lindinha")
    # end

    # it "makes a Member join a role" do 
    #     headers = { "ACCEPT" => "application/json" }
    #     new_role = Role.create!({:name => "Consultora de Atendimento e Vendas", :team => bope})
    #     put "/members/#{larissa.id}", :params => { :member => {:id => larissa.id}, :role_id => new_role.id}, :headers => headers
    #     body = JSON.parse(response.body)
        
    #     expect(response.content_type).to match(/application\/json/)
    #     expect(response).to have_http_status(:ok)
    #     expect(body['roles'][-1]['name']).to eq(new_role.name)
    # end

    # it "makes a Member leave a role" do 
    #     headers = { "ACCEPT" => "application/json" }
    #     put "/members/#{larissa.id}", :params => { :member => {:id => larissa.id}, :role_id => lider.id, :leave_role => true}, :headers => headers
    #     body = JSON.parse(response.body)
        
    #     expect(response.content_type).to match(/application\/json/)
    #     expect(response).to have_http_status(:ok)
    #     expect(body['roles'][-1]).to eq(nil)
    # end

    # it "deletes a Member" do
    #     headers = { "ACCEPT" => "application/json" }
    #     delete "/members/#{larissa.id}", :headers => headers
        
    #     expect(response).to have_http_status(:no_content)
    # end 
end