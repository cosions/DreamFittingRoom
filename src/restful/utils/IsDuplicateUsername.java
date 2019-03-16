package restful.utils;

import java.util.List;

import restful.database.EM;
import restful.entity.MyUser;

/**
 * 用于在注册时判断是否存在相同的用户名
 */
public class IsDuplicateUsername {
	private IsDuplicateUsername() {}
	
	public static boolean isDuplicate(MyUser user) {
		//获取数据库中的所有用户信息
		List<MyUser> result = EM.getEntityManager()
		.createNamedQuery("User.loginGetUserInfo", MyUser.class)
		.getResultList();
		//获取当前需要注册的用户名
		String username = user.getUsername();
		//遍历result
		for(MyUser u : result) {
			if(u.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

}
