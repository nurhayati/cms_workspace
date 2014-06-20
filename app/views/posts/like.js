$link   = $("#posting-like-<%=  @post.id %>");

$sup    = $link.closest('sup')
$sup2   = $link2.closest('sup')
$small  = $link3.closest('small')

<% if @success %>
  <% if @status == 'like' %>
    $sup.addClass('active');
    $sup2.addClass('active');
    $small.addClass('active')

  <% else %>
    $sup.removeClass('active');
    $sup2.removeClass('active');
    $small.removeClass('active')

  <% end %>
<% end %>