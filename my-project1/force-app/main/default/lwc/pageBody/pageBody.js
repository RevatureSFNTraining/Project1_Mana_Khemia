import { LightningElement, wire } from 'lwc';

import { subscribe, unsubscribe, MessageContext } from "lightning/messageService";
import PAGE_CHANNEL from "@salesforce/messageChannel/PageMessageChannel__c";

export default class PageBody extends LightningElement {
    @wire(MessageContext)
    messageContext;

    subscription = null;

    body = "home";

    homePage = true;
    contactsPage = false;
    accountsPage = false;
    contactUsPage = false;
    returnPolicyPage = false;
    privacyPolicyPage = false;

    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                PAGE_CHANNEL,
                (message) => this.handleMessage(message)
            );
        }
    }

    unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    disconnectedCallback() {
        this.unsubscribeToMessageChannel();
    }

    handleMessage(message) {
        this.body = message.pageName;

        switch (this.body) {
            case 'home':
                this.homePage = true;
                this.contactsPage = false;
                this.accountsPage = false;
                this.contactUsPage = false;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = false;
                break;
            case 'contacts':
                this.homePage = false;
                this.contactsPage = true;
                this.accountsPage = false;
                this.contactUsPage = false;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = false;
                break;
            case 'accounts':
                this.homePage = false;
                this.contactsPage = false;
                this.accountsPage = true;
                this.contactUsPage = false;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = false;
                break;
            case 'contactUs':
                this.homePage = false;
                this.contactsPage = false;
                this.accountsPage = false;
                this.contactUsPage = true;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = false;
                break;
            case 'returnPolicy':
                this.homePage = false;
                this.contactsPage = false;
                this.accountsPage = false;
                this.contactUsPage = false;
                this.returnPolicyPage = true;
                this.privacyPolicyPage = false;
                break;
            case 'privacyPolicy':
                this.homePage = false;
                this.contactsPage = false;
                this.accountsPage = false;
                this.contactUsPage = false;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = true;
                break;
            default:
                this.homePage = true;
                this.contactsPage = false;
                this.accountsPage = false;
                this.contactUsPage = false;
                this.returnPolicyPage = false;
                this.privacyPolicyPage = false;
        }
    }
}