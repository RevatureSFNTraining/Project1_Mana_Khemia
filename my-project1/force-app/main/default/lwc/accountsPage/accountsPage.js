import { LightningElement, track } from 'lwc';
	
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class AccountsPage extends LightningElement {
    @track accounts;

    handleLoad() {
        getAccountList()
            .then(result => {
                this.accounts = result;
            });
    }
}