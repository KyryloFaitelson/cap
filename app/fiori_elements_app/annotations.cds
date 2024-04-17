using CatalogService as service from '../../srv/cat-service';


annotate CatalogService.Products with {


  ID               @(Common.Label: '{i18n>Cat.ProductID}');
  title            @(Common.Label: '{i18n>Cat.ProductTitle}');
  description      @(Common.Label: '{i18n>Cat.ProductDescription}');
  availability     @(Common.Label: '{i18n>Cat.ProductAvailability}');
  storage_capacity @(Common.Label: '{i18n>Cat.ProductStorageCapacity}');
  criticality      @(Common.Label: '{i18n>Cat.ProductCriticality}');
  price            @(
    Common.Label        : '{i18n>Cat.ProductPrice}',
    Measures.ISOCurrency: currency_code
  );
  currency         @(Common.Label: '{i18n>Cat.ProductCurrency}');
  supplier         @(Common.Label: '{i18n>Cat.ProductSupplier}');
  image_url        @(UI.IsImageURL: true);
  weight           @(Common.Label: '{i18n>Cat.ProductWeight}');
  ingredients      @(Common.Label: '{i18n>Cat.ProductIngred}');
  format           @(Common.Label: '{i18n>Cat.ProductFormat}');
  rate             @(Common.Label: '{i18n>Cat.ProductRate}');
}

annotate CatalogService.Suppliers with {

  identifier @(Common: {
    Label          : '{i18n>Cat.SuppliersIdentifier}',
    Text           : name,
    TextArrangement: #TextFirst,
  });
  name       @Common.Label: '{i18n>Cat.SupplierName}';
  phone      @Common.Label: '{i18n>Cat.SuppliersPhone}';
  building   @(Common: {
    Label          : '{i18n>Cat.SuppliersStreet}',
    Text           : street,
    TextArrangement: #TextFirst
  });
  street     @Common.Label: '{i18n>Cat.SupplierStreet}';
  postCode   @(Common: {
    Label          : '{i18n>Cat.SuppliersPostCode}',
    Text           : city,
    TextArrangement: #TextFirst
  });
  city       @Common.Label: '{i18n>Cat.SupplierCity}';
  country    @Common.Label: '{i18n>Cat.SuppliersCounty}';


}


annotate service.Products with @(UI: {

  HeaderInfo                    : {
    TypeName      : '{i18n>Cat.TypeName}',
    TypeNamePlural: '{i18n>Cat.TypeNamePlural}',
    Title         : {
      $Type: 'UI.DataField',
      Value: title
    }
  },
  SelectionFields               : [
    identifier,
    title,
    availability,
    price
  ],
  //////////////////////////////////////
  //            LineItem              //
  //////////////////////////////////////
  LineItem                      : [
    {
      $Type                : 'UI.DataField',
      Label                : '{i18n>Cat.ProductImage}',
      Value                : image_url,
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '20%',
      },
      ![@UI.Importance]    : #High
    },
    {
      $Type                : 'UI.DataField',
      Value                : identifier,
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '15%',
      },
      ![@UI.Importance]    : #High
    },
    {
      $Type                : 'UI.DataField',
      Value                : title,
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '20%',
      },
      ![@UI.Importance]    : #High
    },
    {
      $Type                : 'UI.DataField',
      Value                : supplier.name,
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '15%',
      },
      ![@UI.Importance]    : #High
    },
    {
      $Type                : 'UI.DataFieldForAnnotation',
      Target               : '@UI.DataPoint#Availability',
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '20%',
      },
      ![@UI.Importance]    : #High
    },
    {
      $Type                : 'UI.DataField',
      Value                : price,
      ![@HTML5.CssDefaults]: {
        $Type: 'HTML5.CssDefaultsType',
        width: '10%',
      },
      ![@UI.Importance]    : #High
    }
  ],
  //////////////////////////////////////
  //         HeaderFacets             //
  //////////////////////////////////////
  HeaderFacets                  : [
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#Im'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#ProductDetail',
      Label : '{i18n>Cat.HeaderFacetDetails}'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#SupplierDetail',
      Label : '{i18n>Cat.HeaderFacetSupplier}'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.DataPoint#Price'
    }

  ],
  //////////////////////////////////////
  //            Facets                //
  //////////////////////////////////////
  Facets                        : [
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#Description',
      Label : '{i18n>Cat.FacetSectionDescription}'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#ProductInformation',
      Label : '{i18n>Cat.FacetProductInformation}'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#SupplierInfo',
      Label : '{i18n>Cat.FacetSectionSupplierInfo}'
    }
  ],
  //////////////////////////////////////
  //          FieldGroups             //
  //////////////////////////////////////
  FieldGroup #Description       : {Data: [{
    $Type: 'UI.DataField',
    Value: description
  }]},
  FieldGroup #ProductInformation: {Data: [
    {
      $Type: 'UI.DataField',
      Value: identifier
    },
    {
      $Type: 'UI.DataField',
      Value: title
    },
    {
      $Type: 'UI.DataField',
      Value: weight
    },
    {
      $Type: 'UI.DataField',
      Value: ingredients
    },
    {
      $Type: 'UI.DataField',
      Value: format
    },
    {
      $Type: 'UI.DataField',
      Value: price
    },
    {
      $Type : 'UI.DataFieldForAnnotation',
      Label : '{i18n>Cat.ProductRating}',
      Target: '@UI.DataPoint#Rating'
    },
    {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@UI.DataPoint#Availability',
    }
  ]},
  FieldGroup #ProductDetail     : {Data: [
    {
      $Type: 'UI.DataField',
      Value: identifier
    },
    {
      $Type: 'UI.DataField',
      Value: availability
    },
    {
      $Type : 'UI.DataFieldForAnnotation',
      Label : '{i18n>Cat.ProductRating}',
      Target: '@UI.DataPoint#Rating'
    },
  ]},
  FieldGroup #Im                : {Data: [{
    $Type: 'UI.DataField',
    Value: image_url
  }, ]},
  FieldGroup #SupplierDetail    : {Data: [
    {
      $Type: 'UI.DataField',
      Value: supplier.identifier

    },
    {
      $Type: 'UI.DataField',
      Value: supplier.postCode
    },
    {
      $Type: 'UI.DataField',
      Value: supplier.phone
    },
  ]},
  FieldGroup #SupplierInfo      : {Data: [
    {
      $Type: 'UI.DataField',
      Value: supplier.identifier
    },
    {
      $Type: 'UI.DataField',
      Value: supplier.phone
    },
    {
      $Type: 'UI.DataField',
      Value: supplier.building
    },
    {
      $Type: 'UI.DataField',
      Value: supplier.postCode
    },
    {
      $Type: 'UI.DataField',
      Value: supplier.country
    },
  ]},
  //////////////////////////////////////
  //            DataPoints            //
  //////////////////////////////////////
  DataPoint #Rating             : {
    Value        : rate,
    TargetValue  : 5,
    Visualization: #Rating
  },
  DataPoint #Availability       : {
    Value        : availability,
    TargetValue  : 100,
    Visualization: #Progress,
    Criticality  : criticality
  },
  DataPoint #Price              : {
    Value: price,
    Title: '{i18n>Cat.HeaderPrice}'
  },
});
