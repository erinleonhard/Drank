/*Parse.Cloud.define("grabAllHardDrinks", function(request, response){
	var drink_types = Parse.Object.extend("Drink_Types");
	query.equalTo("Name", "Hard Alcohol");
	
	query.find({
		success: function(results){
			alert("Found drinks");
			var id = results[0].get('objectID');
		}


	});
*/

/*//RETURNS ALL (public and private) Drinks with said ID
var getDrinksIDsbyTypeID = function(typeID, userID){
	var drinkrelations = Parse.Object.extend("Drink_DrinkType_Relation");
	query.equalTo("DrinkTypeID", catID);
	query.find({
		success: function(results){
			alert("success with ID");
			for(var i = 0; i< results.length; i++){

			}
		},
		error: function(results){
			alert("errored out without finding stuff");
			return [-1];
		}

}

var getDrinkTypeID = function(typeName){
	var drink_types = Parse.Object.extend("Drink_Types");
	query.equalTo("Name", catName);
		query.find({
		success: function(results){
			alert("Found drinks");
			if(results.length != 1)
				return -1;
			else
				return id = results[0].get('objectID');
		},
		error: function(error){
			alert("errored out without finding stuff");
			return -1;
		}
}*/

//support for custom drinks later