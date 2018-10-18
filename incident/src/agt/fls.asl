
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch2,handle_issue_1) = What | done(sch2,handle_issue_1,Ag)=What) &
	   goalState(sch2,ask_support_fls,_,_,satisfied)
	<- println("Handling first level issues...");
	   //+result(ok);
	   +result(bad);
	   goalAchieved(handle_issue_1)[artifact_id(ArtId)].
	
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch2,provide_feedback_am) = What | done(sch2,provide_feedback_am,Ag)=What) &
	   goalState(sch2,ask_support_fls,_,_,satisfied) &
	   goalState(sch2,handle_issue_1,_,_,satisfied) &
	   result(ok) &
	   play(Am,key_account_manager,incident_group)
	<- println("Providing feedback to key account manager...");
	   .send(Am,tell,provide_feedback_am);
	   goalAchieved(provide_feedback_am)[artifact_id(ArtId)].

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch2,provide_feedback_am) = What | done(sch2,provide_feedback_am,Ag)=What) &
	   goalState(sch2,ask_support_fls,_,_,satisfied) &
	   goalState(sch2,handle_issue_1,_,_,satisfied) &
	   not result(ok) &
	   play(Am,key_account_manager,incident_group) &
	   orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch3, scheme3, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch3)[artifact_id(GrArtId)];
       
       ?goalState(sch3,provide_feedback_fls,_,_,satisfied)[artifact_id(SchArtId)];
	   println("Providing feedback to key account manager...");
	   .send(Am,tell,provide_feedback_am);
	   goalAchieved(provide_feedback_am)[artifact_id(ArtId)].

+!ask_support_sls
	 : true
	<- println("Asking second level support...").
	
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch3,ask_support_sls) = What | done(sch3,ask_support_sls,Ag)=What) &
	   goalState(sch2,ask_support_fls,_,_,satisfied) &
	   goalState(sch2,handle_issue_1,_,_,satisfied) &
	   play(Sls,second_level_support,incident_group)
	<- println("Asking second level support...");
	   .send(Sls,tell,ask_support_sls);
	   goalAchieved(ask_support_sls)[artifact_id(ArtId)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }