$(document).ready(function() {
    $(function() {
        $("button#view-comments").on("click", function() {
            let id = $(this).data("id");
            $.get("/businesses/" + id + ".json", function(data) {

            })
        })
    })
});