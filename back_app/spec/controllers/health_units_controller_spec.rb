require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe HealthUnitsController, type: :controller do

  login_account

  let(:valid_attributes) do
    FactoryBot.attributes_for(:health_unit)
  end

  let(:invalid_attributes) do
    {
      cnes: nil,
      name: '',
      telephone: '',
      address: '',
      neighborhood: '',
      phone: '',
      latitude: nil,
      longitude: nil
   }
  end

  let(:valid_session) { }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do

      get :show, params: { id: FactoryBot.create(:health_unit).id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      health_unit = HealthUnit.create! valid_attributes
      get :edit, params: {id: health_unit.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new HealthUnit" do
        expect {
          post :create, params: {health_unit: valid_attributes},
          session: valid_session
        }.to change(HealthUnit, :count).by(1)
      end

      it "redirects to the created health_unit" do
        post :create, params: {health_unit: valid_attributes},
        session: valid_session
        expect(response).to redirect_to(HealthUnit.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {health_unit: invalid_attributes},
        session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        FactoryBot.build(:health_unit, name: 'A TOTALLY DIFFERENT NAME')
        .attributes
      end

      it "updates the requested health_unit" do
        health_unit = HealthUnit.create! valid_attributes
        put :update, params: {id: health_unit.to_param,
          health_unit: new_attributes}, session: valid_session
        health_unit.reload
        expect(health_unit.name).to eq(new_attributes['name'])
      end

      it "redirects to the health_unit" do
        health_unit = HealthUnit.create! valid_attributes
        put :update, params: {id: health_unit.to_param,
          health_unit: valid_attributes}, session: valid_session
        expect(response).to redirect_to(health_unit)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        health_unit = HealthUnit.create! valid_attributes
        put :update, params: {id: health_unit.to_param,
          health_unit: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested health_unit" do
      health_unit = HealthUnit.create! valid_attributes
      expect {
        delete :destroy, params: {id: health_unit.to_param},
          session: valid_session
      }.to change(HealthUnit, :count).by(-1)
    end

    it "redirects to the health_units list" do
      health_unit = HealthUnit.create! valid_attributes
      delete :destroy, params: {id: health_unit.to_param},
        session: valid_session
      expect(response).to redirect_to(health_units_url)
    end
  end

  describe "Search #search" do
    it "should redirect to #index if no keyword is typed" do
      post :basic_search, params: {keywords: ''}, session: valid_session
      expect(response).to redirect_to(health_units_path)
    end
    it "should make a where call to HealthUnit model" do
      keywords = 'pediatria odontologia'
      expect(HealthUnit).to receive(:where)
      post :basic_search, params: {keywords: keywords}, session: valid_session
    end
  end

  describe "#list_by_specialties" do
    it "should make a where call to HealthUnit model" do
      expect(HealthUnit).to receive(:where)
      get :list_by_specialties, params: {specialty: 'pediatria'},
      session: valid_session
    end
  end

  describe "#list_by_treatments" do
    it "should make a where call to HealthUnit model" do
      expect(HealthUnit).to receive(:where)
      get :list_by_treatments, params: {treatments: 'microcefalia'},
      session: valid_session
    end
  end

  describe "#search_by_neighborhood" do
    it "should make a where call to HealthUnit model" do
      expect(HealthUnit).to receive(:where)
      get :search_by_neighborhood, params: {neighborhood: 'arruda'},
      session: valid_session
    end
  end

end