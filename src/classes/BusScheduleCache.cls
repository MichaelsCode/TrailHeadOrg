public with sharing class BusScheduleCache {
	
	private Cache.OrgPartition part;
	String partitionName = 'local.BusSchedule';


	public BusScheduleCache() {
		if(partitionName != null){
		 Cache.OrgPartition orgPart = new Cache.OrgPartition(partitionName);
		 if(orgpart != null){
		 	part = orgPart; 
		 }
		}
		
	}

	public void putSchedule(String busLine, Time[] schedule){

		if (part != null){
			part.put(busLine,schedule);
		}

	}

	public Time[] getSchedule(String busLine){

		Time[] bSched = new Time[]{};

         

        if (part != null && (Time[])part.get(busLine) != null){

            bSched = (Time[])part.get(busLine);       

        } else{

            bSched.add(Time.newInstance(8,0,0,0));

            bSched.add(Time.newInstance(17,0,0,0));

        }

         

        return bSched;


	}




}