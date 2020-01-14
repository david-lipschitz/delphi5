connect "vt_weaving1:c:\a_usr\vstock\weaving.gdb" user "SYSDBA" password "";

/* Grant permissions for this database */
grant all on downtimejob to barry,greg,paul;
grant all on downtimetype to barry,greg,paul;
grant all on fabrictype to barry,greg,paul;
grant all on greigeoutput to barry,greg,paul;
grant all on loomspec to barry,greg,paul;
grant all on reedjob to barry,greg,paul;
grant all on scenario to barry,greg,paul;
grant all on struloom to barry,greg,paul;
grant all on warptype to barry,greg,paul;
grant all on weaveitem to barry,greg,paul;
grant all on weavejob to barry,greg,paul;
GRANT EXECUTE ON PROCEDURE SPJOBNO TO BARRY,greg,paul;

