$(function() {
  $(function() {
    setInterval(update, 1000);
  });

  function update() {
    let latest_review_id = $('.review:last').data('id');
    console.log('latest_review_id: ' + latest_review_id);
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        review: { id: latest_review_id }
      },
      dataType: 'json'
    });
  }
});
