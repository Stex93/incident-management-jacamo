
+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch4,examine_problem) = What | done(sch4,examine_problem,Ag)=What) &
	   goalState(sch4,ask_support_dev,_,_,satisfied)
	<- println("Examining problem...")
	   goalAchieved(examine_problem)[artifact_id(ArtId)].

+obligation(Ag,_,What,_)[artifact_id(ArtId)]
	 : .my_name(Ag) &
	   (satisfied(sch4,provide_feedback_sls) = What | done(sch4,provide_feedback_sls,Ag)=What) &
	   goalState(sch4,ask_support_dev,_,_,satisfied) &
	   goalState(sch4,examine_problem,_,_,satisfied) &
	   play(Sls,second_level_support,incident_group)
	<- println("Providing feedback to second level support...");
	   .send(Sls,tell,provide_feedback_sls);
	   .send(Sls,tell,result(backlog));
	   goalAchieved(provide_feedback_sls)[artifact_id(ArtId)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("common.asl") }