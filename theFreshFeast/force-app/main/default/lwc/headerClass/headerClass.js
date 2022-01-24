import { LightningElement, api, wire, track} from 'lwc';
import Salesforce_Images from '@salesforce/resourceUrl/Logo';

import { publish, MessageContext } from "lightning/messageService";
import MY_CHANNEL from "@salesforce/messageChannel/MyMessageChannel__c";

export default class HeaderClass extends LightningElement {

    @api Home = 'Home';
    @api ClassicMenu = 'ClassicMenu';
    @api AboutUs = 'AboutUs';
    @api ContactUs = 'ContactUs';
    @api foodtag = 'Fresh prepared food... everyday!  With two convenient locations...!!';

    //@api imageUrl = './resources/logoname.png';
    image1 = Salesforce_Images;

    @wire(MessageContext)
    messageContext;

    handleClick(event){
        const message = {
            pageName: event.target.name
        };
        publish(this.messageContext, MY_CHANNEL, message);
    }
}