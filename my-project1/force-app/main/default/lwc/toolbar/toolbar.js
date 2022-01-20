import { LightningElement, wire } from 'lwc';

import { publish, MessageContext } from "lightning/messageService";
import PAGE_CHANNEL from "@salesforce/messageChannel/PageMessageChannel__c";

export default class Toolbar extends LightningElement {
    @wire(MessageContext)
    messageContext;

    handleTabClick(event) {
        const message = {
            pageName: event.target.name
        };

        publish(this.messageContext, PAGE_CHANNEL, message);
    }
}