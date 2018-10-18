
+!join(OrgArtName,GrArtName,RoleName)
   <- !in_ora4mas;
      lookupArtifact(OrgArtName,OrgArtId);
      +orgArt(OrgArtId);
      focus(OrgArtId);
      lookupArtifact(GrArtName,GrArtId);
      +grArt(GrArtId);
      adoptRole(RoleName)[artifact_id(GrArtId)];
      focus(GrArtId).

+?formationStatus(ok)[artifact_id(G)]
   <- .wait({+formationStatus(ok)[artifact_id(G)]}).
   
+?goalState(Scheme,Goal,X,Y,satisfied)[artifact_id(G)]
   <- .wait({+goalState(Scheme,Goal,X,Y,satisfied)[artifact_id(G)]}).

+!in_ora4mas : in_ora4mas.
+!in_ora4mas : .intend(in_ora4mas)
   <- .wait({+in_ora4mas},100,_);
      !in_ora4mas.
@lin[atomic]
+!in_ora4mas
   <- joinWorkspace("ora4mas",_);
      +in_ora4mas.
