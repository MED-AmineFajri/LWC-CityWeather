@isTest
public with sharing class WeatherApiTest {
    static testMethod void testWeatherApi (){
        Test.setMock(HttpCalloutMock.class, new MockHttp());
        Test.startTest();
            String weather = WeatherApi.getWeather('Casablanca');
            System.debug(weather);
        Test.stopTest();
        System.assertNotEquals(null, weather, 'Success');
    }
}