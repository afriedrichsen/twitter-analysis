------------------------------------------------------------------
--  TABLE flume_keywords
------------------------------------------------------------------

CREATE TABLE flume_agent_keywords
(
   "AGENT_KEYWORD_ID"          SERIAL PRIMARY KEY,
   "AGENT_NAME"         CHARACTER VARYING (1000),
   "KEYWORD"         CHARACTER VARYING (1000),
   "CREATE_TIMESTAMP"   date
);


select fk."AGENT_NAME"||'sources.Twitter.keywords=' as "CONFIG_PARM",string_agg(fk."KEYWORD",', ') as KW_LIST
from public."flume_agent_keywords" fk
where fk."AGENT_NAME"= 'TwitterAgent'
group by fk."AGENT_NAME"
;


------------------------------------------------------------------
--  TABLE flume_configuration
------------------------------------------------------------------

CREATE TABLE flume_configuration
(
   "CONFIG_ID"          INTEGER
                           DEFAULT nextval (
                                      '"flume_configuration_CONFIG_ID_seq"'::regclass),
   "CONFIG_PARM"        CHARACTER VARYING (1000),
   "PARM_VALUE"         CHARACTER VARYING (1000),
   "AGENT_NAME"         CHARACTER VARYING (1000),
   "CREATE_TIMESTAMP"   date
);


