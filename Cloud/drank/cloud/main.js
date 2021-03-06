require('cloud/human.js');
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

Parse.Cloud.define("loadDrinkHistory", function(request, response){
	if(!Parse.User.current()){
		response.error("failed - no current User" + currentUser);
		return;
	}
	var email = Parse.User.current().get('email');

	var User = Parse.Object.extend("User");
	var query = new Parse.Query(User);

	query.get('DelPZfGTtw',{
		success: function(result){
			var drinks = result.get("drinkHistory");
			response.success(drinks);
		},
		error: function(object, error){
			response.error("errored out " + object +" " + error);
		}
	});
});

Parse.Cloud.define("loadRecentTypes", function(request, response){
	if(!Parse.User.current()){
		response.error("failed - no current User" + currentUser);
		return;
	}
	var email = Parse.User.current().get('email');

	var User = Parse.Object.extend("User");
	var query = new Parse.Query(User);

	query.get('DelPZfGTtw',{
		success: function(result){
			var drinks = result.getDrinkHistoryID();
			var innerQuery = new Parse.Query("Drinks");
			innerQuery.containedIn("objectId", drinks);
			innerQuery.find({
				success: function(r){
					response.success(r);
				},
				error: function(o, e){
					response.error("errored out " + o +" " + e);
				}
			})
			//response.success(drinks);
		},
		error: function(object, error){
			response.error("errored out " + object +" " + error);
		}
	});
});


//{"drinkID":"f0VDg2Y3jo", "strength": "1.00", "quantity": "0.5" }
Parse.Cloud.define("addADrink", function(request, response){

	if(!Parse.User.current()){
		response.error("failed - no current User" + currentUser);
		return;
	}
	var email = Parse.User.current().get('email');

	var User = Parse.Object.extend("User");
	var query = new Parse.Query(User);

	var drinkID = request.params.drinkID;
	var strength = parseFloat(request.params.strength);
	var quantity = parseFloat(request.params.quantity);



	query.get('DelPZfGTtw',{
		success: function(result){
			var array = result.addDrink(drinkID, strength, quantity );
			result.save(null, {
				success: function(r){
					response.success(r +"  "+ array);
				},
				error: function(r, error){
					response.error(r + "  " + error + " ---- " + array);
				}
			});
		},
		error: function(object, error){
			response.error("errored out " + object +" " + error);
		}
	});
	//var guy = query.equalTo("email", email);
	//response.success(Parse.User.current().);
	//response.success(guy);

	//var currentBAC = _grabCurrentBAC(currentUser);
});

Parse.Cloud.define("getBAC", function(request, response){

	if(!Parse.User.current()){
		response.error("failed - no current User" + currentUser);
		return;
	}
	var email = Parse.User.current().get('email');

	var User = Parse.Object.extend("User");
	var query = new Parse.Query(User);

	query.get('DelPZfGTtw',{
		success: function(result){
			var bac = result.getBAC();
			response.success(bac);
			
		},
		error: function(object, error){
			response.error("errored out " + object +" " + error);
		}
	});
	//var guy = query.equalTo("email", email);
	//response.success(Parse.User.current().);
	//response.success(guy);

	//var currentBAC = _grabCurrentBAC(currentUser);
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

















