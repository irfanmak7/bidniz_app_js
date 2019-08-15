$(document).ready(function() {
    $(function() {
        $("button#view-comments").on("click", function() {
            let id = $(this).data("id");
            $.get("/businesses/" + id + ".json", function(data) {
                const mycomments = new twoBusiness(data)
                const viewCommentsHTML = mycomments.showCommentsHTML()
                document.getElementById('ajax-comment-data').innerHTML += viewCommentsHTML
            })
            $('button#view-comments').attr("disabled", true)
        })
    })
});

