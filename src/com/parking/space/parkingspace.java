package com.parking.space;


public class parkingspace {
	private String number;
	private String status;
	private String name;
	private String time;
	
	public String getNumber(){
		return number;
	}
	public void setNumber(String number){
		this.number=number;
	}
	
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status=status;
	}

	public String getName(){return name;}
	public void setName(String name){this.name=name;}

	public String GetTime(){return time;}
	public void SetTime(String time){this.time = time;}
}
