import { LightningElement, api, wire } from 'lwc';
import getDesigns from '@salesforce/apex/DesignsController.getDesigns';

export default class TestComponent extends LightningElement {
    @wire(getDesigns) designs;

    COLUMNS = [
        {label: 'Design Name', fieldName: 'Name'},
        {label: 'Design Type', fieldName: 'Completed_Date__c', type: 'date'},
        {label: 'Completed Date', fieldName: 'Design_Type__c', type: 'text'}
    ];

}