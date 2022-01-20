import { LightningElement, track } from 'lwc';
	
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class ContactsPage extends LightningElement {
    @track contacts;

    handleLoad() {
        getContactList()
            .then(result => {
                this.contacts = result;
            });
    }
}