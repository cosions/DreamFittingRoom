package restful.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "clothing_category")
@NamedQueries({ 
		@NamedQuery(name = "clothing.listAll", query = "SELECT c FROM ClothingCategory c"),
		@NamedQuery(name = "clothing.getClothingByCode", query = "SELECT c FROM ClothingCategory c where c.code=:code"),
		}
		)
public class ClothingCategory extends IdEntity {
	//服装类别编号
	private String code;
	//类别名称
	private String cname;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "ClothingCategory [code=" + code + ", cname=" + cname + "]";
	}
	
	
	

}
