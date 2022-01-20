import { LightningElement, wire } from 'lwc';

import { publish, MessageContext } from "lightning/messageService";
import PAGE_CHANNEL from "@salesforce/messageChannel/PageMessageChannel__c";

export default class Footer extends LightningElement {
    @wire(MessageContext)
    messageContext;

    handlePolicyClick(event) {
        const message = {
            pageName: event.target.name
        };

        publish(this.messageContext, PAGE_CHANNEL, message);
    }
}