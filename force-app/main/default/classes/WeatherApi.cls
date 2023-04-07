public with sharing class WeatherApi {
    @AuraEnabled(cacheable=true)
    public static String getWeather(String city){
        APIKey__mdt api = [SELECT Weather__c FROM APIKey__mdt];
        String api_key = api.Weather__c;
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric&appid=' + api_key;

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