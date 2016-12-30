/*
  Javascript API to be added to the REST.html file
*/
<script  type='text/javascript'>
    function countryNames() {
        var request = new XMLHttpRequest();
        request.open('GET', 'http://localhost:8888/ords/rest_data/testmodule/countrynames/', false);  // `false` makes the request synchronous
        request.send(null);

        //alert(request.responseText);

        if (request.status === 200) {
            console.log(request.responseText);
            return request.responseText;
        };

        return false;
    };

    function countryData(pCountryName) {
        var request = new XMLHttpRequest();
        var tURL = "http://localhost:8888/ords/rest_data/testmodule/country/" + pCountryName;
        request.open('GET', tURL, false);  // `false` makes the request synchronous
        request.send(null);

        //alert(request.responseText);

        if (request.status === 200) {
            console.log(request.responseText);
            return request.responseText;
        };

        return false;
    };


</script>
