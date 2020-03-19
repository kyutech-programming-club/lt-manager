$(function() {
  function make_review_template(review) {
    return `<li class="review" data-id="${review.id}">\
              ${review.comment}\
            </li>`;
  }

  function build_new_review(review) {
    let reviews = $('#review-list').prepend(make_review_template(review));
  }

  $(function() {
    setInterval(update, 1000);
  });

  function update() {
    let latest_review_id = $('.review')[0] ? $('.review:first').data('id') : 0;
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        review: { id: latest_review_id }
      },
      dataType: 'json'
    })
    .always(function(data) {
      $.each(data.reverse(), function(i, data) {
        build_new_review(data);
      });
    });
  }
});
