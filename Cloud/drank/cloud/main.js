
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("TestInput", function(request, response){
	var input = request.params.input;
	/*var userID = Parse.User.current().fetch();/*.then(function(user){
		user.get('name');
	});*/
	var userID = Parse.User.current().get('email');
	response.success("Hit" + input + userID);

});


Parse.Cloud.define("addADrink", function(request, response){

	if(!Parse.User.current()){
		response.error("failed - no current User" + currentUser);
		return;
	}
	var currentUser = Parse.User.current().get('email');
	var currentBAC = _grabCurrentBAC(currentUser);
/*	var drinkID = request.params.drinkID;
	var strength = request.params.strength;
	var quantity = request.params.quantity;*/

	//ADD into database
	//quantity gets multipled by strength

	//var additonalBAC = _newBAC(quantity, isMale, weight);
	response.success(currentBAC);
/*	var drink_historyTable = Parse.Object.extend("Drink_History");
	var userTable = Parse.Object.extend("User");
	var userQuery = new Parse.Query(userTable);
	userQuery.equalTo("email", currentUser);
	//var usersTable = Parse.Object.extend(
	var historyQuery = new Parse.Query(drink_historyTable);
	historyQuery.matchesQuery("UserID", userQuery);
	//historyQuery.descending("updatedAt");

	historyQuery.find({
		success: function(results){
			response.success(results);
		},
		error: function(response){
			response.error("failed to find previous Drinks");
		}

	});*/
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
	typeRelationsQurey.include("DrinkID");

	typeRelationsQurey.find({
		success: function(results){
			alert("Found drinks");
			var drinks = [];
			var i;
			for( var i=0; i<results.length; i++){
				drinks[i] = results[i].get("DrinkID");
			}
			response.success(drinks);
			//response.success(JSON.stringify({"drinks": drinks}));
		},
		error: function(results){
			response.error("failed to find");
		}
	});
});

Parse.Cloud.define("grabDrinksFromTonight", function(request, response){
	var TWELVE_HOURS = 60*60*1000*12;


	// bools ((new Date)-myDate) < ONE_HOUR

});

var _grabCurrentBAC = function(email){
	var drink_historyTable = Parse.Object.extend("Drink_History");
	var userTable = Parse.Object.extend("User");
	var userQuery = new Parse.Query(userTable);
	userQuery.equalTo("email", email);
	var historyQuery = new Parse.Query(drink_historyTable);
	historyQuery.matchesQuery("UserID", userQuery);
	historyQuery.descending("updatedAt");
	var returnValue;
	 historyQuery.find({
		success: function(results){
			response.success(results);
			if(results.length === 0){
				return 0;
			}
			var bac = results[0].get('bac');
			//3600000 mil seconds = 1 hour
			var dT = ((new Date) - results[0].get('updatedAt'))/(3600000);
			bac -= (0.015 * dT);
			returnValue= bac > 0 ? bac : 0;
			return returnValue;
		},
		error: function(response){
			//response.error("work");
			returnValue -1;
		}
	});
	 return returnValue;
}



var _newBAC = function(quantity, isMale, weight){
	var bac = (quantity * 105.5)/weight;
	var genderConstant = isMale ? 0.68 : 0.55;
	return bac * genderConstant;
}















