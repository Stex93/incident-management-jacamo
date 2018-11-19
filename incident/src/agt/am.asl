can_handle(easy_problem).

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,ask_description) = What | done(sch1,ask_description,Ag)=What) &
	   play(Customer,customer,incident_group)
	<- //println("Asking description...");
	   //.send(Customer,tell,ask_description);
	   //goalAchieved(ask_description)[artifact_id(ArtId)].
	   println("Cannot ask for description").
	   
+oblUnfulfilled(O)
	 : .my_name(Ag) &
	   obligation(Ag,_,What,_) = O &
	   (satisfied(sch1,ask_description) = What | done(sch1,ask_description,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied)
	<- println("Explaining why I couldn't ask description").

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,explain_solution) = What | done(sch1,explain_solution,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   goalState(sch1,send_description,_,_,satisfied) &
	   play(Customer,customer,incident_group) &
	   description(D) &
	   can_handle(D)
	<- println("Explaining solution...");
	   .send(Customer,tell,explain_solution);
	   goalAchieved(explain_solution)[artifact_id(ArtId)].

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch1,explain_solution) = What | done(sch1,explain_solution,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   goalState(sch1,send_description,_,_,satisfied) &
	   play(Customer,customer,incident_group) &
	   description(D) &
	   not can_handle(D) &
	   orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch2, scheme2, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch2)[artifact_id(GrArtId)];
       
       ?goalState(sch2,provide_feedback_am,_,_,satisfied)[artifact_id(SchArtId)];
       println("Explaining solution...");
       goalAchieved(explain_solution)[artifact_id(ArtId)].

+oblUnfulfilled(O)
	 : .my_name(Ag) &
	   obligation(Ag,_,What,_) = O &
	   (satisfied(sch1,explain_solution) = What | done(sch1,explain_solution,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   goalState(sch1,send_description,_,_,satisfied)
	<- println("Explaining why I couldn't explain solution").

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch2,ask_support_fls) = What | done(sch2,ask_support_fls,Ag)=What) &
	   goalState(sch1,have_problem,_,_,satisfied) &
	   goalState(sch1,ask_description,_,_,satisfied) &
	   goalState(sch1,send_description,_,_,satisfied) &
	   play(Fls,first_level_support,incident_group)
	<- println("Asking first level support...");
	   .send(Fls,tell,ask_support_fls);
	   goalAchieved(ask_support_fls)[artifact_id(ArtId)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }