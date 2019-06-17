# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfilesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/usuarios').to route_to('user_profiles#index')
    end

    it 'routes to #new' do
      expect(get: '/usuarios/new').to route_to('user_profiles#new')
    end

    it 'routes to #show' do
      expect(get: '/usuarios/1').to route_to('user_profiles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/usuarios/1/edit').to route_to('user_profiles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/usuarios').to route_to('user_profiles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/usuarios/1').to route_to('user_profiles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/usuarios/1').to route_to('user_profiles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/usuarios/1').to route_to('user_profiles#destroy', id: '1')
    end
  end
end
