package restful.api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import restful.annotation.Power;
import restful.bean.Result;
import restful.database.EM;
import restful.entity.ClothingCategory;

@Path("/clothingCategory")
public class ClothingCategoryAPI {
	
	@POST
	@Path("/listAll")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result listAllCategory() {
		List<ClothingCategory> result = EM.getEntityManager()
		.createNamedQuery("clothing.listAll", ClothingCategory.class)
		.getResultList();
		return new Result(0, "查询所有分类信息成功", result, "");
	}
	
	@POST
	@Path("/add")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result add(ClothingCategory cc) {
		List<ClothingCategory> result = EM.getEntityManager()
				.createNamedQuery("clothing.listAll", ClothingCategory.class)
				.getResultList();
		System.out.println(cc);
		for(ClothingCategory c : result) {
			if(c.getCode().equals(cc.getCode())) {
				return new Result(-1, "编号已存在", "", "");
			}
		}
		cc.setId(0);
		cc = EM.getEntityManager().merge(cc);
		EM.getEntityManager().persist(cc);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "添加成功", "", "");
	}
	
	@POST
	@Path("/alter")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result alter(ClothingCategory cc) {
		System.out.println(cc);
		List<ClothingCategory> result = EM.getEntityManager()
		.createNamedQuery("clothing.getClothingByCode", ClothingCategory.class)
		.setParameter("code", cc.getCode())
		.getResultList();
		
		ClothingCategory c = result.get(0);
		c.setCname(cc.getCname());
		EM.getEntityManager().merge(c);
		EM.getEntityManager().persist(c);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "修改成功", "", "");
	}
	
	@POST
	@Path("/del")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result del(ClothingCategory cc) {
		EM.getEntityManager().remove(EM.getEntityManager().merge(cc));
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "删除成功", "", "");
	}

}
