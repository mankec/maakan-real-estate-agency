class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, label = nil, options = {})
    classes = join_classes(options[:class], "form-label")

    options.merge! class: classes

    super method, label, options
  end

  def text_field(method, options = {})
    classes = join_classes(options[:class], "form-control")

    options.merge! class: classes

    super method, options
  end

  def submit(method, options = {})
    classes = join_classes(options[:class], "btn btn-primary")

    options.merge! class: classes

    super method, options
  end

  private

  def join_classes(classes, default_classes)
    if classes.present?
      classes.split.push(*default_classes.split).join(" ")
    else
      default_classes
    end
  end
end
