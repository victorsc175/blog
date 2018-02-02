require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      expect { get users_path }.to raise_exception(Pundit::NotAuthorizedError)
    end
  end
end
