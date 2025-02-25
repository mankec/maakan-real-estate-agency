class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, label = nil, options = {})
    options.merge! class: "form-label"

    super method, label, options
  end

  def text_field(method, options = {})
    options.merge! class: "form-control"

    super method, options
  end

  def submit(method, options = {})
    options.merge! class: "btn btn-primary"

    super method, options
  end
end
