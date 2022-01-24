import { LightningElement, track } from 'lwc';

export default class ContactUs extends LightningElement {

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