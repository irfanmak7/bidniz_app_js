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