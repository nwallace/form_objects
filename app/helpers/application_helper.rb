module ApplicationHelper

  def link_to_add_fields(link_text, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: ":fieldset_id") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to link_text, "#", class: "btn btn-info", data: { add_fields: "'#{escape_javascript(fields)}'" }
  end

  def link_to_remove_fields(link_text, f)
    f.hidden_field(:_destroy) +
      link_to(link_text, "#", data: { remove_fields: true }, class: "close")
  end
end
