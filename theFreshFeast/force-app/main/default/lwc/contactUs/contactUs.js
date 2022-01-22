import { LightningElement, api, wire } from 'lwc';
import  getAccounts  from '@salesforce/apex/DataSendController.getAccounts';


export default class ContactUs extends LightningElement {

    @api recordId;

    @wire(getAccounts,{})
    wiredRecord({data, error}){
        console.log(data);
        /*if(data){
            const { fields } = data
            object.keys(fields).forEach(item => {
                let value = fields[item] && fields[item].displayValue ? fields[item].displayValue : fields[item].value;
                this.result = { ...this.result, [item]: value}
            })
            console.log(JSON.stringify(data))
        }
        if(error){
            console.log(error)
        }*/
    }

    mapMarkers1 = [
        {
            location: {
                Street: '187 CT-81',
                City: 'Killingworth',
                State: 'CT 06419',
                Country: 'USA',
            },
            title: 'The Cooking Company',
            },
    ];
    zoomLevel = 15;
    mapMarkers2 = [
        {
            location: {
                Street: '350 Main St #1st',
                City: 'Middletown',
                State: 'CT 06419',
                Country: 'USA',
            },
            title: 'The Cooking Company',
            
            },
    ];
    zoomLevel = 15;
}