module HasArrayFields
  extend ActiveSupport::Concern

  included do
    before_save do
      clean_empty_values_in_array_fields
    end

    private

    def clean_empty_values_in_array_fields
      array_fields = self.class.columns.select { |c| c.sql_type_metadata.sql_type == "json" }

      array_fields.each do |field|
        value = send field.name

        send("#{field.name}=", value.reject(&:blank?))
      end
    end
  end
end
