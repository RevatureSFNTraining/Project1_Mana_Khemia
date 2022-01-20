import { LightningElement } from 'lwc';

export default class App extends LightningElement {
    showHome=true;
    showAbout=false;
    showShop=false;


    changeDir(e){
        switch(e.detail){
            case 'home':
                this.showHome=true;
                this.showAbout=false;
                this.showShop=false;
                break;
            case 'about':
                this.showHome=false;
                this.showAbout=true;
                this.showShop=false;
                break;
            case 'shop':
                this.showHome=false;
                this.showAbout=false;
                this.showShop=true;
                break;
        }

    }
}