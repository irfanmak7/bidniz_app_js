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

twoBusiness.prototype.showCommentsHTML = function() {
    
    let postComments = this.comments.map(comment =>{
        return (`
            <p>${comment.content}</p>
        `)
    }).join("")

    return (`
        <div
        <br>
            <h2>Comments</h2>
            <p>${postComments}</p>
        </div>
    `)
}