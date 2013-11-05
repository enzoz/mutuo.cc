class RewardsController < ApplicationController
  load_and_authorize_resource
  inherit_resources
  belongs_to :project
  respond_to :html, :json

  def index
    render layout: false
  end

  def new
    render layout: false
  end

  def edit
    render layout: false
  end

  def update
    @reward.update_attribute(:minimum_value, (parent.goal / @reward.maximum_backers))
    @reward.reload
    update! { project_by_slug_path(permalink: parent.permalink) }
  end

  def create
    @reward.minimum_value = (@reward.project.goal / @reward.maximum_backers).to_f
    @reward.days_to_delivery = @reward.project.online_days
    @reward.description = "Default reward [#{@reward.project.name}]"
    create! { project_by_slug_path(permalink: parent.permalink) }
  end

  def destroy
    destroy! { project_by_slug_path(permalink: resource.project.permalink) }
  end

  def sort
    resource.update_attribute :row_order_position, params[:reward][:row_order_position]

    render nothing: true
  end
end
