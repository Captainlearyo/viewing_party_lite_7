require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do 
  before(:each) do
    load_test_data
  end

  it 'When I visit the new viewing party page it contains movie title, duration of party, when date, start time, checkboxes next to each user' do

    visit "/users/#{@user1.id}/movies/268/viewing-party/new"
    expect(page).to have_field(:duration, with:126)
    expect(page).to have_field(:date)
    expect(page).to have_field(:start_time)
    expect(page).to have_button('Create Party')
    expect(page).to have_content('Batman')

    fill_in :duration, with: 180
    fill_in :start_time, with: '10:00'
    fill_in :date, with: '2023/08/01'
    click_button 'Create Party'

    expect(current_path).to eq(user_path(@user1.id))
    expect(page).to have_content('Batman')
  end
end