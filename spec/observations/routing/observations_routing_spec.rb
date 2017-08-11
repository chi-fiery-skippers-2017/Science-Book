require 'rails_helper'

RSpec.describe "Routing to observations", :type => :routing do
  it "routes GET 'experiments/:id/observations' => 'observations#index'" do
    expect(get: 'experiments/:id/observations').to route_to({
      "controller"=>"observations",
      "action"=>"index",
      "id"=>":id"})
  end

  it "routes POST 'experiments/:id/observations' => 'observations#create'" do
    expect(post: 'experiments/:id/observations').to route_to({
      "controller"=>"observations",
      "action"=>"create",
      "id"=> ":id"})
  end
end