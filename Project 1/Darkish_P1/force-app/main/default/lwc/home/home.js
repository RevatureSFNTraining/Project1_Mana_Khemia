import{LightningElement} from 'lwc';
import Site_Images from '@salesforce/resourceUrl/Site_Images';


export default class Home extends LightningElement{
    
    siteArrow = Site_Images + '/Site_Images/Arrow-icon.png';
    siteFacebook = Site_Images + '/Site_Images/facebook-icon.png';
    siteInstagram = Site_Images + '/Site_Images/Instagram-icon.png';
    siteTwitter = Site_Images + '/Site_Images/twitter-icon.png';
    siteProduct1 = Site_Images + '/Site_Images/product-1.jpg';
    siteProduct2 = Site_Images + '/Site_Images/product-2.png';
    siteProduct3 = Site_Images + '/Site_Images/product-3.png';
}