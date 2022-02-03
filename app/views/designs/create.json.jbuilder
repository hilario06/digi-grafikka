if @design.persisted?
  json.form json.partial!('designs/form.html.erb', portfolio: @portfolio, design: Design.new)
  json.inserted_item json.partial!('designs/design.html.erb', design: @design)
else
  json.form json.partial!('designs/form.html.erb', portfolio: @portfolio, design: @design)
end
