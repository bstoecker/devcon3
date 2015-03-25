require 'spec_helper'

describe RepositoriesController do
  describe 'GET #new' do
    it 'assigns @repository' do
      get :new
      expect(assigns(:repository)).to be_a_new(Repository)
    end
  end

  describe 'POST #create' do
    before :each do
      post :create, repository: { link: 'http://github.com/mariomainz/devcon3-teams.git' }
    end

    it 'assigns @repository' do
      expect(assigns(:repository)).to be_a(Repository)
    end

    it 'redirects to the root path' do
      expect(response).to redirect_to(root_path)
    end

    describe 'DELETE #destroy' do
      before :each do
        @repository = Repository.create(link: 'http://github.com/mariomainz/devcon3-teams.git')
      end

      it 'deletes the repository' do
        expect { delete :destroy, id: 1 }.to change { Repository.count }.by(-1)
      end

      it 'redirects to the root path' do
        delete :destroy, id: 1
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
