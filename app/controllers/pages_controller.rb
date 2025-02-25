class PagesController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def property_listing
  end

  def property_types
  end

  def add_property
  end

  def update_property_form
    respond_to do |format|
      format.turbo_stream do
        property = PropertyFactory.build params[:property_type]

        render turbo_stream: turbo_stream.replace(
          "property-form",
          partial: "#{property.class.name.downcase.pluralize}/form",
          locals: { property: property }
        )
      end
    end
  end

  def our_agents
  end

  def testimonials
  end
end
