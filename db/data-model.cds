namespace my.pilot_project;

using {
    managed,
    Currency,
    cuid
} from '@sap/cds/common';

entity Products : managed {
        @Common.Label : 'UUID'
    key ID               : UUID;
        identifier       : String           @Common.Label : 'ID';
        title            : localized String @(Common.Label : 'Name');
        description      : localized String;
        availability     : Integer;
        storage_capacity : Integer;
        criticality      : Integer;
        price            : Decimal(3,2);
        currency         : Currency;
        supplier         : Composition of one Suppliers;
        image_url        : String;
        weight           : String;
        ingredients      : localized String(1111);
        format           : localized String(111);
        rate             : Integer;
}

entity Suppliers : managed, cuid {
    identifier : String;
    name       : String;
    phone      : String;
    building   : String;
    street     : String @multiline;
    postCode   : String;
    city       : String;
    country    : String;
    products   : Composition of one Products
                     on products.supplier = $self;
}