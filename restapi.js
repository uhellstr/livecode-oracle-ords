/*
  Javascript API to be added to the REST.html file
*/
<script  type='text/javascript'>

    function countryNames() {
        var request = new XMLHttpRequest();
        var tURL = "http://localhost:8080/ords/orclpdb1/apex/rest_data/testmodule/countrynames/";
        request.open('GET', tURL, false);  // `false` makes the request synchronous
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
        var tURL = "http://localhost:8080/ords/orclpdb1/apex/rest_data/testmodule/country/" + pCountryName;
        request.open('GET', tURL, false);  // `false` makes the request synchronous
        request.send(null);

        //alert(request.responseText);

        if (request.status === 200) {
            console.log(request.responseText);
            return request.responseText;
        };

        return false;
    };

    function plotLiveCode(pCountryName) {
      var request = new XMLHttpRequest();
      var tURL = "http://localhost:8080/ords/orclpdb1/apex/rest_data/testmodule/graphlivecode/" + pCountryName;
      request.open('GET', tURL, false);  // `false` makes the request synchronous
      request.send(null);

      //alert(request.responseText);

      if (request.status === 200) {
          console.log(request.responseText);
          return request.responseText;
      };

      return false;
    };

    function plotData(pdata) {
      var data = [pdata];
      Plotly.newPlot('myDiv', data);
    };

</script>
