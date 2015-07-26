var User = Parse.Object.extend("User", {
	
	
	
	testLoad: function(){
		return "Hello world, welcome to humans";
	},

	//drinkHistory
	getBAC: function (){
		if(this.drinkHistory.length === 0)
			return 0;
		var lastDrink = this.drinkHistory[this.drinkHistory.length -1];
		var dT = ((new Date) - lastDrink.timeStamp)/3600000;
		bac = lastDrink.bac - (0.015 * dT);
		if(bac > 0)
			return bac;
		this.stashPastNightOut();
		return 0;
	},


	addDrink: function(drinkID, strength, quantity){
		var startingBAC = this.getBAC();
		var quantityAdj = quantity * strength; 
		var additonalBAC = _newBAC(quantityAdj, isMale, weight);
		var drink = {
			drinkID: drinkID,
			strength: strength,
			quantity: quantity,
			timeStamp: new Date,
			bac: startingBAC + additonalBAC
		}
		this.drinkHistory.push(bac);
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