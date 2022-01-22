import { LightningElement, wire } from 'lwc';

import { subscribe, unsubscribe, MessageContext } from "lightning/messageService";
import MY_CHANNEL from "@salesforce/messageChannel/MyMessageChannel__c";

export default class PageBody extends LightningElement {

    @wire(MessageContext)
    messageContext;

    subscription = null;
    
    body = "home";

    menuClass = false;
    homeImage = true;
    homeClass = true;
    aboutUsClass = false;
    contactUs = false;

    subscribeToMessageChannel(){
        if(!this.subscription){
            this.subscription = subscribe(
                this.messageContext,
                MY_CHANNEL,
                (message) => this.handleMessage(message)
                );
        }
    }

    unsubscribeToMessageChannel(){
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    disconnectedCallback(){
        this.unsubscribeToMessageChannel();
    }

    handleMessage(message){
        this.body = message.pageName;

        switch(this.body){

            case 'home':
                this.homeClass = true;
                this.homeImage = true;
                this.menuClass = false;
                this.aboutUsClass = false;
                this.contactUs = false;
                break;

            case 'menu':
                this.homeImage = false;
                this.homeClass = false;
                this.menuClass = true;
                this.aboutUsClass = false;
                this.contactUs = false;
                break;

            case 'aboutus':
                this.homeImage = false;
                this.homeClass = false;
                this.menuClass = false;
                this.aboutUsClass = true;
                this.contactUs = false;
                break;

            case 'contactus':
                this.homeImage = false;
                this.homeClass = false;
                this.menuClass = false;
                this.aboutUsClass = false;
                this.contactUs = true;
                break;

            default:
                this.homeImage = true;
                this.homeClass = true;
                this.menuClass = false;
                this.aboutUsClass = false;
                this.contactUs = false;
                break;
        }
    }
}