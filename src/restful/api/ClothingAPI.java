package restful.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import restful.annotation.Power;
import restful.bean.Result;
import restful.database.EM;
import restful.entity.Clothing;
import restful.entity.ClothingCategory;
import restful.entity.MyUser;

@Path("/clothing")
public class ClothingAPI {
	@Context
	private HttpServletRequest requset;
	
	@POST
	@Path("/listAll")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result listAllCategory(Clothing cc) {
		List<Clothing> result = EM.getEntityManager()
		.createNamedQuery("cloth.listAll", Clothing.class)
		.getResultList();
		List<Clothing> list = new ArrayList<>();
		for(Clothing c : result) {
			if(c.getClothingSex().equals(cc.getClothingSex()) &&  c.getSort().equals(cc.getSort())) {
				list.add(c);
			}
		}
		return new Result(0, "查询所有分类信息成功", list, "");
	}
	
	@POST
	@Path("/listAll2")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result listAll2(Clothing cc) {
		List<Clothing> result = EM.getEntityManager()
		.createNamedQuery("cloth.listAll", Clothing.class)
		.getResultList();
		System.out.println("sort:---"+cc.getSort());
		List<Clothing> list = new ArrayList<>();
		//获取当前用户的性别
		String sex = ((MyUser)requset.getSession().getAttribute("curUser")).getSex();
		//选出满足当前分类与性别的服饰
		for(Clothing c :result) {
			if(cc.getSort().equals(c.getSort()) && sex.equals(c.getClothingSex())) {
				list.add(c);
			}
		}
		return new Result(0, "查询所有分类信息成功", list, "");
	}
	
	@POST
	@Path("/add")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result add(Clothing cc) {
		List<Clothing> result = EM.getEntityManager()
				.createNamedQuery("cloth.listAll", Clothing.class)
				.getResultList();
		System.out.println(cc);
		for(Clothing c : result) {
			if(c.getCode().equals(cc.getCode())) {
				return new Result(-1, "编号已存在", "", "");
			}
		}
		cc.setId(0);
		cc.setImage("none");
		cc = EM.getEntityManager().merge(cc);
		EM.getEntityManager().persist(cc);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "添加成功", cc, "");
	}
	
	@POST
	@Path("/alter")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result alter(Clothing cc) {
		System.out.println(cc);
		List<Clothing> result = EM.getEntityManager()
		.createNamedQuery("cloth.getClothingByCode", Clothing.class)
		.setParameter("code", cc.getCode())
		.getResultList();
		
		Clothing c = result.get(0);
		c.setClothingName(cc.getClothingName());
		c.setPrice(cc.getPrice());
		c.setClothingSex(cc.getClothingSex());
		c.setSort(cc.getSort());
		//c.setImage(cc.getImage());
		EM.getEntityManager().merge(c);
		EM.getEntityManager().persist(c);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "修改成功", c, "");
	}
	
	@POST
	@Path("/del")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result del(Clothing cc) {
		EM.getEntityManager().remove(EM.getEntityManager().merge(cc));
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "删除成功", cc, "");
	}

}
