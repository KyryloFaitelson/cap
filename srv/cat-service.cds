using {my.pilot_project as my} from '../db/data-model';

@path : '/browse'
service CatalogService {
    
    entity Products as projection on my.Products;
    entity Suppliers as projection on my.Suppliers;
}
annotate CatalogService.Products with  @odata.draft.enabled;