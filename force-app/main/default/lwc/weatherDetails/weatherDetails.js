import { LightningElement, wire } from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import VILLE_MESSAGE from '@salesforce/messageChannel/VilleChannel__c';
import getWeather from '@salesforce/apex/WeatherApi.getWeather';

export default class WeatherDetails extends LightningElement {
  subscription = null;
  result = {};
  isDataReceived = false;
  @wire(MessageContext)
  messageContext;
  connectedCallback() {
    this.subscription = subscribe(
        this.messageContext,
        VILLE_MESSAGE,
        (message) => {
            this.weatherApi(message.ville);
        });
  }
  disconnectedCallback() {
    unsubscribe(this.subscription);
    this.subscription = null;
  }
  weatherApi(ville) {
    getWeather({city : ville})
            .then(result => {
                let res = JSON.parse(result);
                res.temp = res.main.temp;
                res.pressure = res.main.pressure;
                res.humidity = res.main.humidity;
                res.temp_max = res.main.temp_max;
                res.temp_min = res.main.temp_min;
 
                this.result = res;
                this.isDataReceived = true;
            })
            .catch((error) => {
                console.log("Erreur : " + error);
            })
  }
}