	   
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch3,handle_issue_2) = What | done(sch3,handle_issue_2,Ag)=What) &
	   goalState(sch3,ask_support_sls,_,_,satisfied)
	<- println("Handling second level issues...");
	   //+unsure(no);
	   //+result(resolved);
	   //+result(backlog);
	   +unsure(yes);
	   goalAchieved(handle_issue_2)[artifact_id(ArtId)].
	   
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch3,provide_feedback_fls) = What | done(sch3,provide_feedback_fls,Ag)=What) &
	   goalState(sch3,ask_support_sls,_,_,satisfied) &
	   goalState(sch3,handle_issue_2,_,_,satisfied) &
	   unsure(no)
	<- !finish.

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch3,provide_feedback_fls) = What | done(sch3,provide_feedback_fls,Ag)=What) &
	   goalState(sch3,ask_support_sls,_,_,satisfied) &
	   goalState(sch3,handle_issue_2,_,_,satisfied) &
	   unsure(yes) &
	   orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch4, scheme4, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch4)[artifact_id(GrArtId)];
       
       ?goalState(sch4,provide_feedback_sls,_,_,satisfied)[artifact_id(SchArtId)];
       
       !finish.
       
+!finish
	 : result(resolved) &
	   play(Fls,first_level_support,incident_group)
	<- println("Providing feedback to first level support...");
	   .send(Fls,tell,provide_feedback_fls);
	   lookupArtifact(sch3,SchArtId);
	   goalAchieved(provide_feedback_fls)[artifact_id(SchArtId)].
	   
+!finish
	 : result(backlog) &
	   play(Fls,first_level_support,incident_group)
	<- println("Inserting issue into backlog...");
	   +insert_backlog;
	   println("Providing feedback to first level support...");
	   .send(Fls,tell,provide_feedback_fls);
	   lookupArtifact(sch3,SchArtId);
	   goalAchieved(provide_feedback_fls)[artifact_id(SchArtId)].

//+!ask_support_dev
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch4,ask_support_dev) = What | done(sch4,ask_support_dev,Ag)=What) &
	   play(Dev,developer,incident_group)
	<- println("Asking to developer...");
	   .send(Dev,tell,ask_support_dev);
	   goalAchieved(ask_support_dev)[artifact_id(ArtId)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }