
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});
<<<<<<< HEAD

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
	response.error("failed");
})

Parse.Cloud.define("addADrink", function(request, response){
	var currentUser = Parse.User.
	response.success("drink added");
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

=======
>>>>>>> f1597a4f205d1916cb244fb3c8270e8c3a346a1e
