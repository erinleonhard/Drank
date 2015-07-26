
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("TestInput", function(request, response){
	var input = request.params.input;
	var userID = Parse.User.current();
	response.success("Hit" + input + userID);

});

Parse.Cloud.define("sysActive", function(request, response) {
	// body...
	Parse.User.login("DelPZfGTtw", "passsword",{
		success: function (user) {
			response.success(worked);
			// body...
		},
		error: function(user, error){
			response.success("failed");
		}

			});
	response.success("worked?");
	//response.error("failed");
})

Parse.Cloud.define("addADrink", function(request, response){
	var currentUser = Parse.User.current();
	if(!currentUser){
		response.error("failed - no current User");
		return;
	}
	response.success("drink added");
});

Parse.Cloud.define("grabDrinkByType", function(request, response){
	var drinkType = request.params.DrinkType;
	alert(drinkType)
	//Grab Tables
	var drink_typesTable = Parse.Object.extend("Drink_Types");
	var drink_Type_relationsTable = Parse.Object.extend("Drink_DrinkType_Relation");
	var drinksTable = Parse.Object.extend("Drinks");
	
	//Start Queries
	var typesQuery = new Parse.Query(drink_typesTable);
	var typeRelationsQurey = new Parse.Query(drink_Type_relationsTable);
	var drinksQuery = new Parse.Query(drinksTable);

	//Where clauses/Joins
	typesQuery.equalTo("Name", drinkType);
	typesQuery.exists("objectId");
	typeRelationsQurey.matchesQuery("DrinkTypeID", typesQuery);
	typeRelationsQurey.exists("DrinkID");
	//drinksQuery.equalTo("public", true);
	//if not switch
	//drinksQuery.matchesQuery("DrinkID", typeRelationsQurey.DrinkID);
	typeRelationsQurey.include("DrinkID");
/*	drinksQuery.matches(a, b, c)
	drinksQuery.matchesQuery(a, b)
	drinksQuery.matchesKeyInQuery(a, b, c)*/

	typeRelationsQurey.find({
		success: function(results){
			alert("Found drinks");
			var drinks = [];
			var i;
			for( var i=0; i<results.length; i++){
				//var jsonBlob = {}

				drinks[i] = results[i].get("DrinkID");
			}


			response.success(drinks);
			//response.success(results.get('DrinkID'));

			//var id = results[0].get('objectID');
		},
		error: function(results){
			response.error("failed to find");
		}
	});
});

/*Parse.Cloud.define("AddADrink", function(request, response){

});*/

// /functions/TestInput?movie=hit

/*var user = new Parse.User(){
	user.set("username", name);
	user.set("passsword", password);
	user.set("email", email);

	//
	user.set("weight", weight);
	user.set("isMale", true);
	user.set(")
}*/

