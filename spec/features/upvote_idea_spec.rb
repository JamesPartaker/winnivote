require 'features/features_helper'

feature "Upvoting an idea increases the votes", :js do

  let!(:idea) { create(:idea) }

  before do
    log_me_in
    @current_page = PageModels.landing_page
    @current_page.load
  end
  
  subject { @current_page.idea_list.idea_items.first }

  before { subject.upvote! }

  it "shows the updated vote count" do
    expect(subject.vote_count).to have_content '1'
  end

end
