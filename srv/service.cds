using my.bookshop as mybookshop from '../db/schema';

service BookcatalogService {
    //To apply read-only operation on master data, use @readonly
    @readonly entity Books as select from mybookshop.Books;
    entity Authors as projection on mybookshop.Authors;
    entity Orders as projection on mybookshop.Orders; 
}

//2nd service def.
service Stats {
    @readonly entity OrderInfo as projection on mybookshop.Orders excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy,
        book
    }
}