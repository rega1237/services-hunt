shared_context 'request_context' do
  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    Category.destroy_all
    Service.destroy_all
    ServiceCategory.destroy_all
    Comment.destroy_all
    User.destroy_all
  end
end