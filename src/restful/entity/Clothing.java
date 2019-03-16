package restful.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "clothing")
@NamedQueries({ 
		@NamedQuery(name = "cloth.listAll", query = "SELECT c FROM Clothing c"),
		@NamedQuery(name = "cloth.getClothingByCode", query = "SELECT c FROM Clothing c where c.code=:code"),
		}
		)
public class Clothing extends IdEntity {
	
	//编号
	private String code;
	//名称
	private String clothingName;
	//价格
	private String price;
	//性别
	private String clothingSex;
	//分类
	private String sort;
	//图片
	private String image;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClothingName() {
		return clothingName;
	}
	public void setClothingName(String clothingName) {
		this.clothingName = clothingName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getClothingSex() {
		return clothingSex;
	}
	public void setClothingSex(String clothingSex) {
		this.clothingSex = clothingSex;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	

}
