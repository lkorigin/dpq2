module dpq2;

debug import std.experimental.logger;

shared static this()
{
    version(Derelict_Static) {}
    else {
        debug
        {
            trace("DerelictPQ loading...");
        }

        DerelictPQ.load();

        debug
        {
            trace("...DerelictPQ loading finished");
        }
    }
}

public
{
    import derelict.pq.pq;
    
    import dpq2.connection;
    import dpq2.query;
    import dpq2.result;
    import dpq2.oids;
}
