const cds = require('@sap/cds')
const req = require('express/lib/request')
const { Products } = cds.entities


/** Service implementation for CatalogService */
module.exports = cds.service.impl(srv => {
  srv.after('READ', 'Products', each => {
    if (each.availability >= 80) {
      _addDiscount2(each, 7);
    }
    _addCriticality(each);
  });
  
  srv.before('*', (req) => {
    console.debug('>>>', req.method, req.target.name)
  });
});

/** Add some discount for overstocked Products */
function _addDiscount2(each, discount) {
  const price = each.price.toFixed(2); // Round to 2 decimal places
  const discountedPrice = (price * (1 - discount/100)).toFixed(2); // Calculate discounted price and round to 2 decimal places
  each.price = +discountedPrice; // Convert back to Decimal(3,2) type
  each.title += ` (${discount}% discount!)`;
}

function _addCriticality(each) {
  if (each.availability >= 50) {
    each.criticality = 3;
  } else if (each.availability >= 20) {
    each.criticality = 2;
  } else {
    each.criticality = 1;
  }
}