
+play(Me,customer,_)
	 : .my_name(Me)
	<- !solve_a_problem.

+!solve_a_problem
	 : orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch1, scheme1, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       ?formationStatus(ok)[artifact_id(GrArtId)];
       addScheme(sch1)[artifact_id(GrArtId)].

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,have_problem) = What | done(sch1,have_problem,Ag)=What) &
	   play(Am,key_account_manager,incident_group)
	<- println("I have a problem!");
	   .send(Am,tell,have_problem);
	   goalAchieved(have_problem)[artifact_id(ArtId)].

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,send_description) = What | done(sch1,send_description,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   play(Am,key_account_manager,incident_group)
	<- //println("Sending description...");
	   //.send(Am,tell,description(easy_problem));
	   //.send(Am,tell,description(hard_problem));
	   //goalAchieved(send_description)[artifact_id(ArtId)].
	   println("Cannot send description :(").
	
+requestProof(obligation(Me,_,done(_,send_description,Me),_))[source(am)]
	 : goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   obligationUnfulfilled(obligation(Me,_,done(_,send_description,Me),_)) &
	   play(Am,key_account_manager,incident_group) &
	   .my_name(Me)
	<- .send(Am,tell,proof("System failure"));
	   println("Proof requested! Failure due to system fault!").

+requestProof(obligation(Me,_,done(_,send_description,Me),_))[source(boss)]
	 : goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   obligationUnfulfilled(obligation(Me,_,done(_,send_description,Me),_)) &
	   play(Bo,boss,incident_group) &
	   .my_name(Me)
	<- .send(Bo,tell,proof("System failure"));
	   println("Proof requested! Failure due to system fault!").

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
     : .my_name(Ag) &
	   (satisfied(sch1,root1) = What | done(sch1,root1,Ag)=What)
	<- println("Problem solved. Thank you!")
	   goalAchieved(root1)[artifact_id(ArtId)].
	   
+obligationUnfulfilled(obligation(am,X,done(Y,ask_description,am),Z))
	 : goalState(sch1,have_problem,_,_,satisfied)
	<- println("Obligation to ask_description unfulfilled by am. Asking why...");
	   .send(am,tell,requestProof(obligation(am,X,done(Y,ask_description,am),Z))).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }