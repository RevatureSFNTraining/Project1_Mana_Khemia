import{LightningElement, api} from 'lwc';

export default class Home extends LightningElement{
    @api avalability = 'avaliable';
    @api price = '$0.00';
    @api image = '';
}