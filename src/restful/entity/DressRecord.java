package restful.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "dressRecord")
@NamedQueries({ 
		@NamedQuery(name = "dress.listAll", query = "SELECT c FROM DressRecord c"),
		@NamedQuery(name = "dress.getRecordByUsername", query = "SELECT c FROM DressRecord c where c.username=:username"),
		@NamedQuery(name = "dress.getRecordByID", query = "SELECT c FROM DressRecord c where c.id=:id"),
		@NamedQuery(name = "dress.getRecordByUsernameAndClothingCode", query = "SELECT c FROM DressRecord c where c.username=:username and c.clothingCode=:code"),
		}
		)
public class DressRecord  extends IdEntity{
	//用户名
	private String username;
	//服饰编号
	private String clothingCode;
	//z-index
	private int z_index;
	//服饰分类编号
	private String clothing_cate_code;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getClothingCode() {
		return clothingCode;
	}
	public void setClothingCode(String clothingCode) {
		this.clothingCode = clothingCode;
	}
	public int getZ_index() {
		return z_index;
	}
	public void setZ_index(int z_index) {
		this.z_index = z_index;
	}
	public String getClothing_cate_code() {
		return clothing_cate_code;
	}
	public void setClothing_cate_code(String clothing_cate_code) {
		this.clothing_cate_code = clothing_cate_code;
	}
	
	

}
