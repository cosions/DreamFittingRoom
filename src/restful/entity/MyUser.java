package restful.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "myUser")
@NamedQueries({ 
		@NamedQuery(name = "User.loginGetUserInfo", query = "SELECT user FROM MyUser user"),
		@NamedQuery(name = "User.getUserInfoByUsername", query = "SELECT user FROM MyUser user where user.username=:username"),
		}
		)
public class MyUser extends IdEntity {
	// 用户名
	private String username;
	// 密码
	private String password;
	// 用户实名
	private String realName;
	// 性别
	private String sex;
	//权限
	private String power;
	//头像
	private String image;
	

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	

}
