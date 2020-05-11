  <%= f.fields_for :notes do |note_form| %>
    <%= note_form.label :note %>
    <%= note_form.text_area :content, rows: 5, cols: 50 %>
    <br/>
  <% end %>