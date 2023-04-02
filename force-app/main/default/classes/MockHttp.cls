@isTest
global class MockHttp implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"coord":{"lon":-7.6192,"lat":33.5928},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":24.12,"feels_like":24.36,"temp_min":24.12,"temp_max":24.12,"pressure":1025,"humidity":68,"sea_level":1025,"grnd_level":1022},"visibility":10000,"wind":{"speed":6.45,"deg":18,"gust":7.55},"clouds":{"all":47},"dt":1680354674,"sys":{"type":1,"id":2408,"country":"MA","sunrise":1680329909,"sunset":1680375006},"timezone":0,"id":2553604,"name":"Casablanca","cod":200}');
        res.setStatusCode(200);
        return res;
    }
}