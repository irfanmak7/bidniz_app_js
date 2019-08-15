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