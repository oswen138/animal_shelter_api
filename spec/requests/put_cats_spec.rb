require 'rails_helper'

describe "put all animals route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20)}

  before do
    put '/animals/1', params: { :name => 'test_name', :age => 'test_age', :breed => 'test_breed' }
  end  

  it 'updates the body of animal' do
    expect(JSON.parse(response.body)['message']).to eq 'This animal has been updated successfully.'
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end