var User = Parse.Object.extend("User", {
	


	testLoad: function(){
		return "Hello world, welcome to humans";
	},

	//drinkHistory
	getBAC: function (){
		//return this.get("drinkHistory");
		if(!Array.isArray(this.get("drinkHistory")) || this.get("drinkHistory").length === 1)
			return 0;
		var lastDrink = this.get("drinkHistory")[this.get("drinkHistory").length -1];
		var dT = ((new Date) - lastDrink.timeStamp)/3600000;
		bac = lastDrink.bac - (0.015 * dT);
		if(bac > 0 )
			return bac;
		this.stashPastNightOut();
		return 0;
	},

//{"drinkID":"f0VDg2Y3jo", "strength": "1.00", "quantity": "0.5" }
// quantiy = % Alc * number of drinks EX: shot of KC = 0.5 * 2

	addDrink: function(drinkID, strength, quantity){
		var startingBAC = this.getBAC();
		var quantityAdj = quantity * strength; 
		var additonalBAC = _newBAC(quantityAdj, this.get("isMale"), this.get("weight"));
		var drink = {
			drinkID: drinkID,
			strength: strength,
			quantity: quantity,
			timeStamp: new Date,
			bac:  (isNaN(parseInt(startingBAC)) ? 0 : startingBAC) + (isNaN(parseInt(additonalBAC)) ? 0 : additonalBAC)
		}
		var array = this.get("drinkHistory")
		if(Array.isArray(array))
			array.push(drink);
		else{
			array = [];
			array[0] = drink;
		}
		this.set("drinkHistory", array);
		return JSON.stringify("1 " + array);
		//return JSON.stringify({drinkID: drinkID, strength: strength,quantity: quantity, additonalBAC: additonalBAC});
	},

	getDrinkHistoryID: function(){
		var drinkStructArray = this.get("drinkHistory");
		if(!Array.isArray(drinkStructArray))
			return [];
		var returnArray = [];
		for(var i =0; i<drinkStructArray.length; i++){
			returnArray[i] = drinkStructArray[i].drinkID;
		}
		return returnArray;
	},

	stashPastNightOut: function(){
		var past_Nights = Parse.Object.extend("past_Nights");
		past_Nights.UserID = this.objectID;
		past_Nights.drinkList = this.drinkHistory;
		past_Nights.start = this.drinkHistory[0].timeStamp;
		past_Nights.end = this.drinkHistory[this.drinkHistory.length - 1].timeStamp;

		//start a new night
		this.drinkHistory = [];
		past_Nights.save(null,{
			success: function(past_Nights){
				response.success(past_Nights);
			},
			error: function(error){
				response.error(error);
			}
		});
	}

});


var _newBAC = function(quantity, isMale, weight){
	var bac = (quantity * 10.55)/weight;
	var genderConstant = isMale ? 0.68 : 0.55;
	return bac * genderConstant;
}