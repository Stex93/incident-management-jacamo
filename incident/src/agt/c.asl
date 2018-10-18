
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

+!have_problem
	<- println("I have a problem!").

+!send_description
	<- println("Sending description...").

+!root1
	<- println("Problem solved. Thank you!").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
{ include("common.asl") }