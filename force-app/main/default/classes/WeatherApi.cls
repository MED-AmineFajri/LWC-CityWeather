public with sharing class WeatherApi {
    @AuraEnabled(cacheable=true)
    public static String getWeather(String city){
        String APIKey = '9698e1d59e16681170017eedb0b8b082';
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric&appid=' + APIKey;

        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        response = http.send(request);
        if (response.getStatusCode() == 200) {
            String data = response.getBody();
            return data;
        } else{
            System.debug('Erreur');
            return '';
        }
    }
}