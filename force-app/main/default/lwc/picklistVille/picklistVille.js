import { LightningElement, wire } from 'lwc';
import getCities from '@salesforce/apex/VilleController.getCities';
import VILLE_MESSAGE from '@salesforce/messageChannel/VilleChannel__c';
import { publish, MessageContext } from 'lightning/messageService';

export default class PicklistVille extends LightningElement {
    cityList = [];

    @wire(MessageContext) messageContext;
    @wire(getCities)
    wiredAccounts({ data, error }) {
        if(data){
            let array = [];
            data.forEach(element => {
                let city = {
                    label: element.BillingCity,
                    value: element.BillingCity,
                };
                array.push(JSON.parse(JSON.stringify(city)));
            });
            this.cityList = JSON.parse(JSON.stringify(array));
        }
        else if (error) {
            console.log(error);
        }
    }

    get cities() {
        return this.cityList;
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

    handleClick(){
        const message = {
            ville: this.value
        };
        publish(this.messageContext, VILLE_MESSAGE, message);
    }
}