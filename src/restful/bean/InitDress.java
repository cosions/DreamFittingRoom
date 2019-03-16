package restful.bean;

import restful.entity.Clothing;

public class InitDress {
	private int recordID;
	private Clothing clothing;
	private int z_index;
	
	
	public int getRecordID() {
		return recordID;
	}
	public void setRecordID(int recordID) {
		this.recordID = recordID;
	}
	public Clothing getClothing() {
		return clothing;
	}
	public void setClothing(Clothing clothing) {
		this.clothing = clothing;
	}
	public int getZ_index() {
		return z_index;
	}
	public void setZ_index(int z_index) {
		this.z_index = z_index;
	}
	
}
