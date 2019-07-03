class LikesController < ApplicationController
  def create
    interactive = Interactive.interactive_like(current_user.id, params[:passive_id])
    @interactive = Interactive.create active_id: current_user.id, passive_id: params[:passive_id], action: :like if interactive.blank?
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)}
      format.js
    end
  end

  def destroy
    byebug
    @interactive = Interactive.find_by id: params[:id]
    @interactive.destroy
    respond_to do |format|
      format.js
    end
  end
end
