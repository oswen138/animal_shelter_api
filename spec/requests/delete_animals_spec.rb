require 'rails_helper'

describe "AnimalsController", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20)}

  before do
    delete '/animals/1', params: { :name => 'test_name', :age => 'test_age', :breed => 'test_breed' }
  end  

  it 'returns delete message' do
    expect(JSON.parse(response.body)['message']).to eq('Animal deleted')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end