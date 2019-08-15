$(document).ready(function() {
    $(function() {
        $("button#businesses-more-info").on("click", function(){
            let id = $(this).data("id");
            $.get("/businesses/" + id + ".json", function(data) {
                
            })
        })
    })
})