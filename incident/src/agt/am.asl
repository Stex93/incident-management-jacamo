    
+!ask_description
	 : true
	<- println("Asking description...").

+!explain_solution
	 : orgArt(OrgArtId) &
	   grArt(GrArtId)
	<- createScheme(sch2, scheme2, SchArtId)[artifact_id(OrgArtId)];
       debug(inspector_gui(on))[artifact_id(SchArtId)];
       focus(SchArtId);
       
       addScheme(sch2)[artifact_id(GrArtId)];
       
       ?goalState(sch2,provide_feedback_am,_,_,satisfied)[artifact_id(SchArtId)];
       println("Explaining solution...").
       
+!ask_support_fls
	 : true
	<- println("Asking first level support...").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
{ include("common.asl") }