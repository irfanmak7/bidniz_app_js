$(function() {
    console.log('main.js is loaded...')
    listenForAllBusinessesClick()
});


function listenForAllBusinessesClick() {
    $('button#businesses-data').on('click', function(event) {
        event.preventDefault()
        getAllBusinesses()
        $('button#businesses-data').attr("disabled", true)
    })
}

function getAllBusinesses() {
    $.get('/businesses/all' + '.json', function(jsonData) {
        jsonData.forEach(function (data) {
            console.log("The data is:  ", data)
            const mybusiness = new Business(data)
            const myBusinessHTML = mybusiness.postAllBusinessesHTML()
            document.getElementById('ajax-businesses').innerHTML += myBusinessHTML
        });
    })
}

class Business {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.description = obj.description
        this.address = obj.address
        this.price = obj.price
        this.comments = obj.comments
    }
}

Business.prototype.postAllBusinessesHTML = function() {
    return (`
        <div>
            <h4>${this.name}</h4>
            <p>Price: $${this.price}</p>
            <button align="center" type="button" class="link_button"><a href="/businesses/${this.id}">View Listing</a></button>
        </div>
    `)
}