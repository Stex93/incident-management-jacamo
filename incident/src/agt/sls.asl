
+!handle_issue_2
	 : true
	<- println("Handling second level issues...");
	   !check.
	   
+!check
	 : orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch4, scheme4, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch4)[artifact_id(GrArtId)];
       
       ?goalState(sch4,provide_feedback_sls,_,_,satisfied)[artifact_id(SchArtId)].

+!ask_support_dev
	<- println("Asking to developer...").
	
+!insert_backlog
	<- println("Inserting issue into backlog...").
	
+!provide_feedback_fls
	<- println("Providing feedback to first level support...").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
{ include("common.asl") }