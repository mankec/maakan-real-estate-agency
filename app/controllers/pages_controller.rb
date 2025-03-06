class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[ add_property ]

  def about
  end

  def contact
  end

  def property_types
  end

  def add_property
  end

  def our_agents
  end

  def testimonials
  end

  def bypass_sign_in
    sign_in User.first

    if current_user.present?
      redirect_to root_path, notice: "You have been signed in."
    else
      redirect_to root_path, alert: "Something went wrong."
    end
  end

  def search_property
    redirect_to properties_path(
      region: params[:region],
      property_type: params[:property_type]
    )
  end
end
