// Call the dataTables jQuery plugin
$(document).ready(function () {
  $("#dataTable").DataTable();
});
$(document).ready(function () {
  $("#recent-orders").DataTable({
    lengthMenu: [5, 10, 20, 50],
    paging: true,
    dom: "rtip",
    info: false,
  });
});
$(document).ready(function () {
    $("#users").DataTable({
    lengthMenu: [5, 10, 20, 50],
    paging: true,
    dom: "rtip",
    info: false,
  });
});$(document).ready(function () {
    $("#products-popular").DataTable({
    lengthMenu: [5, 10, 20, 50],
    paging: true,
    dom: "rtip",
    info: false,
  });
});
