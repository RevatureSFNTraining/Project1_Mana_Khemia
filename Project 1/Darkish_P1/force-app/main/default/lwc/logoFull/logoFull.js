import{LightningElement} from 'lwc';
import Site_Images from '@salesforce/resourceUrl/Site_Images';

export default class Home extends LightningElement{
    myLogo = Site_Images + '/Site_Images/logo-cropped.png';
}