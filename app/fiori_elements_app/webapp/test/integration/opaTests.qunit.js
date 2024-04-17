sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/nttdata/fiorielementsapp/test/integration/FirstJourney',
		'com/nttdata/fiorielementsapp/test/integration/pages/ProductsList',
		'com/nttdata/fiorielementsapp/test/integration/pages/ProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/nttdata/fiorielementsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);