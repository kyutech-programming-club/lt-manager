alert("Hello")
$(function() {
  $(function() {
    setInterval(update, 1000);
  });

  function update() {
    console.log("update called.")
  }
})
