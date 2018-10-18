/* Initial goals */

!start.

/* Plans */

+!start
	<- createWorkspace("ora4mas");
       joinWorkspace("ora4mas",WOrg);

       makeArtifact(myorg, "ora4mas.nopl.OrgBoard", ["src/org/incident.xml"], OrgArtId)[wid(WOrg)];
       
       focus(OrgArtId);
       createGroup(incident_group, incident_management_group, GrArtId);
       debug(inspector_gui(on))[artifact_id(GrArtId)];
       adoptRole(company)[artifact_id(GrArtId)];
       focus(GrArtId);
       
       .send(c, achieve, join(myorg,incident_group,customer));
       .send(am, achieve, join(myorg,incident_group,key_account_manager));
       .send(fls, achieve, join(myorg,incident_group,first_level_support));
       .send(sls, achieve, join(myorg,incident_group,second_level_support));
       .send(dev, achieve, join(myorg,incident_group,developer)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }