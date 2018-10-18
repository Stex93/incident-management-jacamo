
+!handle_issue_1
	 : true
	<- println("Handling first level issues...").
	
+!provide_feedback_am
	 : orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch3, scheme3, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch3)[artifact_id(GrArtId)];
       
       ?goalState(sch3,provide_feedback_fls,_,_,satisfied)[artifact_id(SchArtId)];
	   println("Providing feedback to key account manager...").

+!ask_support_sls
	 : true
	<- println("Asking second level support...").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
{ include("common.asl") }