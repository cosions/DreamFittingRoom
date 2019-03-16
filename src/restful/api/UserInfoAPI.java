package restful.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import restful.annotation.Power;
import restful.bean.Result;
import restful.database.EM;
import restful.entity.DressRecord;
import restful.entity.MyUser;
import restful.utils.IsDuplicateUsername;

@Path("/userInfo")
public class UserInfoAPI {
	@Context
	private HttpServletRequest requset;

	@POST
	@Path("/login")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result login(MyUser user) {
		// 查询数据库
		List<MyUser> result = EM.getEntityManager().createNamedQuery("User.loginGetUserInfo", MyUser.class)
				.getResultList();
		// 前台传来的用户名与密码
		String username = user.getUsername();
		String password = user.getPassword();
		System.out.println("username: " + username + " password: " + password);
		System.out.println("result size:" + result.size());
		// 遍历结果集
		for (MyUser u : result) {
			System.out.println("ressult username: " + u.getUsername() + " password: " + u.getPassword());
			if (username.equals(u.getUsername())) {
				if (password.equals(u.getPassword())) {
					requset.getSession().setAttribute("curUser", u);
					return new Result(0, "登录成功", "", "");
				} else {
					return new Result(-1, "用户名或密码错误", "", "");
				}
			}
		}
		return new Result(-1, "用户名不存在", "", "");
	}

	@POST
	@Path("/register")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result register(MyUser user) {
		if(IsDuplicateUsername.isDuplicate(user)) {
			return new Result(-1, "用户名已存在!", "", "");
		}
		user.setPower("普通用户");
		if (user.getSex().equals("man")) {
			user.setSex("男");
		} else {
			user.setSex("女");
		}
		user.setId(0);
		user = EM.getEntityManager().merge(user);
		EM.getEntityManager().persist(user);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "注册成功", "", "");
	}

	@POST
	@Path("/curUserInfo")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result curUserInfo() {
		MyUser u = (MyUser) requset.getSession().getAttribute("curUser");
		// 为了使hibernate不进行自动更新，此处新建一个对象
		MyUser user = new MyUser();
		user.setId(u.getId());
		user.setImage(u.getImage());
		user.setPassword(u.getPassword());
		user.setPower(u.getPower());
		user.setUsername(u.getUsername());
		user.setSex(u.getSex().equals("男") ? "man" : "woman");
		user.setRealName(u.getRealName());
		return new Result(0, "获取当前用户信息成功", user, "");
	}

	@POST
	@Path("/alterCurUser")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result alterCurUser(MyUser user) {
		MyUser u = (MyUser) requset.getSession().getAttribute("curUser");
		u.setRealName(user.getRealName());
		String sex = user.getSex();
		if (sex.equals("man")) {
			u.setSex("男");
		} else {
			u.setSex("女");
		}
		//判断是否更改人物模型
		if (! user.getImage().equals(u.getImage())) {
			//更改了模型，之前的着装记录清空
			u.setImage(user.getImage());
			List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsername", DressRecord.class)
					.setParameter("username", u.getUsername())
					.getResultList();
			for (DressRecord dr : list) {
				EM.getEntityManager().remove(dr);
				EM.getEntityManager().getTransaction().commit();
			}
		}
		String password = user.getPassword();
		if (!("".equals(password))) {
			u.setPassword(password);
		}
		EM.getEntityManager().merge(u);
		EM.getEntityManager().persist(u);
		EM.getEntityManager().getTransaction().commit();		
		
		
		requset.getSession().setAttribute("curUser", u);
		return new Result(0, "修改成功", u, "");
	}

	@POST
	@Path("/all")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result all() {
		List<MyUser> result = EM.getEntityManager().createNamedQuery("User.loginGetUserInfo", MyUser.class)
				.getResultList();
		return new Result(0, "获取全部信息成功", result, "");
	}
	
	@POST
	@Path("/cache")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result cache() {
		EM.getEntityManager().createNamedQuery("User.loginGetUserInfo", MyUser.class)
				.getResultList();
		return new Result(0, "获取缓存成功", "", "");
	}

	@POST
	@Path("/getOne")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result getOne(MyUser user) {
		List<MyUser> result = EM.getEntityManager().createNamedQuery("User.getUserInfoByUsername", MyUser.class)
				.setParameter("username", user.getUsername()).getResultList();
		// 为了使hibernate不进行自动更新，此处新建一个对象
		MyUser u = new MyUser();
		u.setId(result.get(0).getId());
		u.setImage(result.get(0).getImage());
		u.setPassword(result.get(0).getPassword());
		u.setPower(result.get(0).getPower());
		u.setUsername(result.get(0).getUsername());
		u.setSex(result.get(0).getSex().equals("男") ? "man" : "woman");
		u.setRealName(result.get(0).getRealName());
		return new Result(0, "获取信息成功", u, "");
	}
	
	@POST
	@Path("/alter")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result alter(MyUser user) {
		List<MyUser> result = EM.getEntityManager()
		.createNamedQuery("User.getUserInfoByUsername", MyUser.class)
		.setParameter("username", user.getUsername())
		.getResultList();
		MyUser u = result.get(0);
		u.setRealName(user.getRealName());
		if(!"".equals(user.getPassword())) {
			u.setPassword(user.getPassword());
		}
		u.setSex(user.getSex().equals("man")?"男":"女");
		//判断是否更改人物模型
		if (! user.getImage().equals(u.getImage())) {
			//更改了模型，之前的着装记录清空
			u.setImage(user.getImage());
			List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsername", DressRecord.class)
					.setParameter("username", u.getUsername())
					.getResultList();
			for (DressRecord dr : list) {
					EM.getEntityManager().remove(dr);
					EM.getEntityManager().getTransaction().commit();
				}
		}
		u.setPower(user.getPower());
		EM.getEntityManager().merge(u);
		EM.getEntityManager().persist(u);
		EM.getEntityManager().getTransaction().commit();
		//如果修改的为当前登录的用户，则需更新 左上角的当前登录用户的用户
		if (user.getUsername().equals(((MyUser)requset.getSession().getAttribute("curUser")).getUsername())){
			return new Result(1, "修改成功", u, "");
		} else {
			return new Result(0, "修改成功", u, "");
		}
	}
	
	@POST
	@Path("/del")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result del(MyUser user) {
		EM.getEntityManager().remove(EM.getEntityManager().merge(user));
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "删除成功", "", "");
	}
	
	@POST
	@Path("/getModel")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result getModel() {
		MyUser u = (MyUser) requset.getSession().getAttribute("curUser");
		String image = u.getImage();
		return new Result(0, "删除成功", image, "");
	}
	
	@POST
	@Path("/exit")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result exit() {
		requset.getSession().setAttribute("curUser",null);
		return new Result(0, "成功退出", "", "");
	}

}
