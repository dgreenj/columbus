document.addEventListener("DOMContentLoaded", function() {
  // Check if the current page is analyst_dash.html
  if (window.location.pathname.includes("analyst_dash")) {
    // Hide the footer
    document.querySelector(".page-footer").style.display = "none";
  }
});
