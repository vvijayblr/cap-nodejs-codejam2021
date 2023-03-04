module.exports = (srv) => {
  //console.log('Service Name: ', srv.name);

  //notice in the code below the custom logic is implemented in two different ways,
  //using two different programming styles - you only need one of them.
  //Comment out (or delete) one of them, leaving the one you prefer.
  if (srv.name === "BookcatalogService") {
    srv.after("READ", "Books", (srv) => {
      // CHOOSE ONLY ONE OF THESE ...
      // AND LET US KNOW YOUR PREFERENCE AND WHY! :-)

      // option 1 start
      //xs.map((x) => x.stock > 500 && (x.title = `(5% off!) ${x.title}`));
      // option 1 end

      // option 2 start
      let newBooks = [];
      srv.forEach((x) => {
        if (x.stock > 500) {
          x.title = "(5% off!) " + x.title;
        }
        newBooks.push(x);
      });
      return newBooks;
      // option 2 end
    });
  }
};
