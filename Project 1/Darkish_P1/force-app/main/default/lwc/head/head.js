import { LightningElement, api} from 'lwc';

import Site_Images from '@salesforce/resourceUrl/Site_Images';

export default class App extends LightningElement {
    @api directory = 'home';

    homeActive='active';
    aboutActive='';
    shopActive='';

    siteImages = Site_Images;

    myLogo = Site_Images + '/Site_Images/logo-B.png';

    changeDir(e){
        switch(e.target.value){
            case 'Home':
                this.homeActive='active';
                this.aboutActive='';
                this.shopActive='';

                this.directory = 'home';
                break;
            case 'Vendors':
                this.homeActive='';
                this.aboutActive='active';
                this.shopActive='';

                this.directory = 'about';
                break;
            case 'Polls':
                this.homeActive='';
                this.aboutActive='';
                this.shopActive='active';

                this.directory = 'shop';
                break;
        }

        this.dispatchEvent(new CustomEvent('changedir', {detail: this.directory}));
    }
}