/**
 * Created by p.organa on 11.12.2016.
 */
@RestResource(UrlMapping='/testPoint')
global with sharing class po_RESTresource {

    @HttpGet
    global static List<Account> methodGET() {
        return [SELECT Id, Name, BillingAddress, ShippingCountry FROM Account];
    }


}