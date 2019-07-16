class CommentsController < ApplicationController
    before_action :authenticate_account!
    before_action :assert_account_has_profile
    before_action :set_page

    def create
      @comment = @page.comments.new comment_params
      @comment.user_profile = UserProfile.find_by account_id: current_account.id
      if @comment.save
        redirect_to @page
      else
        if ['ServiceProvider', 'ProfessionalProfile',
          'FamilyHealthSupportCenter'].include? @page.class.name
          render "#{@page.class.name.underscore}/show"
        else
          render 'health_units/show', locals: { health_unit: @page }
        end
      end
    end

    def edit
      @comment = @page.comments.find(params[:id])
    end

    def update
      @comment = @page.comments.find(params[:id])

      if @comment.update(comment_params)
        redirect_to @page
      else
        render 'edit'
      end
    end

    def destroy
      @comment = @page.comments.find(params[:id])
      @comment_id = @comment.id
      @comment.destroy
      # redirect_to page_path(@health_unit)
    end

    private
      def comment_params
        params.require(:comment).permit(:body)
      end

      def set_page
        if params[:service_provider_id].present?
          @page = ServiceProvider.find(params[:service_provider_id])
        elsif params[:professional_profile_id].present?
          @page = ProfessionalProfile.find(params[:professional_profile_id])
        elsif params[:family_health_support_center].present?
          @page = FamilyHealthSupportCenter.find(
            params[:family_health_support_center])
        else
          id = params.keys.select { |key| /_id\z/.match(key)}[0]
          @page = HealthUnit.find(params[id])
        end
      end
end