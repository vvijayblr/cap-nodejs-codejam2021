//https://github.com/SAP-archive/cloud-cap-nodejs-codejam/tree/master/exercises/05
namespace my.bookshop;
using {cuid, managed, Currency} from '@sap/cds/common';

entity Books {
    key ID     : Integer;
        title  : String;
        stock  : Integer;
        author : Association to Authors;
}

entity Authors {
    key ID    : Integer;
        name  : String;
        books : Association to many Books
                    on books.author = $self;
}

entity Orders : cuid, managed {
    //key ID       : UUID; //UUID is use of generic feature
        book     : Association to Books;
        quantity : Integer;
        currency : Currency // explict type assignment from @sap/cds/common.cds
}
