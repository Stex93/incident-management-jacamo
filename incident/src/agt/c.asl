
+play(Me,customer,_)
	 : .my_name(Me)
	<- .wait(100);
	   !solve_a_problem.

+!solve_a_problem
	 : orgArt(OrgArtId) &
	   grArt(GrArtId) &
	   play(Am,key_account_manager,incident_group)
	<- createScheme(sch1, scheme1, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       ?formationStatus(ok)[artifact_id(GrArtId)];
       addScheme(sch1)[artifact_id(GrArtId)];
       println("I have a problem!");
	   .send(Am,tell,have_problem).

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,send_description) = What | done(sch1,send_description,Ag)=What) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   play(Am,key_account_manager,incident_group)
	<- println("Sending description...");
	   //.send(Am,tell,description(easy_problem));
	   .send(Am,tell,description(hard_problem));
	   goalAchieved(send_description)[artifact_id(ArtId)].
	   //println("Cannot send description :(").
	   
+oblUnfulfilled(O)
	 : .my_name(Ag) &
	   obligation(Ag,_,What,_) = O &
	   (satisfied(sch1,send_description) = What | done(sch1,send_description,Ag)=What) &
	   goalState(sch1,ask_description,_,_,satisfied)
	<- println("Obligation to send_description unfulfilled. System error!").

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
     : .my_name(Ag) &
	   (satisfied(sch1,problem_management) = What | done(sch1,problem_management,Ag)=What)
	<- println("Problem solved. Thank you!")
	   goalAchieved(problem_management)[artifact_id(ArtId)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }