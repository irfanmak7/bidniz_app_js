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

class twoBusiness {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.description = obj.description
        this.address = obj.address
        this.price = obj.price
        this.comments = obj.comments
    }
}