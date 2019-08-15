$(document).ready(function() {
    $(function() {
        $("button#businesses-more-info").on("click", function(){
            let id = $(this).data("id");
            $.get("/businesses/" + id + ".json", function(data) {
                const mybusiness1 = new oneBusiness(data)
                const myBusiness1HTML = mybusiness1.postAdditionalInfoHTML()
                document.getElementById('ajax-additional-info').innerHTML += myBusiness1HTML        
            })
            $('button#businesses-more-info').attr("disabled", true)
        })
    })
})

class oneBusiness {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.description = obj.description
        this.address = obj.address
        this.price = obj.price
        this.comments = obj.comments
    }
}

oneBusiness.prototype.postAdditionalInfoHTML = function() {

}