package restful.api;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import restful.bean.InitDress;
import restful.bean.Result;
import restful.database.EM;
import restful.entity.Clothing;
import restful.entity.DressRecord;
import restful.entity.MyUser;

@Path("/dressRecord")
public class DressRecordAPI {
	@Context
	private HttpServletRequest request;
	
	
	@POST
	@Path("/listAll")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result listAllRecord() {
		List<DressRecord> result = EM.getEntityManager()
		.createNamedQuery("dress.listAll", DressRecord.class)
		.getResultList();
		return new Result(0, "查询着装记录成功", result, "");
	}
	
	@POST
	@Path("/add")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result add(DressRecord dr) {
		dr.setId(0);
		dr.setUsername(((MyUser)request.getSession().getAttribute("curUser")).getUsername());
		
		//判断当前用户是否有此类别的服饰是否已经有一件穿上
		List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsername", DressRecord.class)
				.setParameter("username", dr.getUsername())
				.getResultList();
		for (DressRecord d : list) {
			if (d.getClothing_cate_code().equals(dr.getClothing_cate_code())) {
				EM.getEntityManager().remove(d);
				EM.getEntityManager().getTransaction().commit();
			}
		}
	
		dr = EM.getEntityManager().merge(dr);
		EM.getEntityManager().persist(dr);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "增加记录成功", "", "");
	}
	
	@POST
	@Path("/alter")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result alter(DressRecord dr) {
		List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsernameAndClothingCode", DressRecord.class)
		.setParameter("username", ((MyUser)request.getSession().getAttribute("curUser")).getUsername())
		.setParameter("code", dr.getClothingCode())
		.getResultList();
		DressRecord d = list.get(0);
		d.setZ_index(dr.getZ_index());
		d = EM.getEntityManager().merge(d);
		EM.getEntityManager().persist(d);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "修改成功", "", "");
	}
	
	@POST
	@Path("/delByRecordID")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result listAllCategory(DressRecord dr) {
		List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByID", DressRecord.class)
		.setParameter("id", dr.getId()).getResultList();
		DressRecord d = list.get(0);
		//获取当前删除的衣服的对象传给前台，更新当前着装的价格
		List<Clothing> list2 = EM.getEntityManager().createNamedQuery("cloth.getClothingByCode", Clothing.class)
		.setParameter("code", d.getClothingCode()).getResultList();
		Clothing clothing = list2.get(0);
		EM.getEntityManager().remove(d);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "删除成功", clothing, "");
	}
	
	@POST
	@Path("/delByUsernameAndClothingCode")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result delByUsernameAndClothingCode(DressRecord dr) {
		List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsernameAndClothingCode", DressRecord.class)
		.setParameter("username", ((MyUser)request.getSession().getAttribute("curUser")).getUsername())
		.setParameter("code", dr.getClothingCode())
		.getResultList();
		DressRecord d = list.get(0);
		EM.getEntityManager().remove(d);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "删除成功", "", "");
	}
	
	@POST
	@Path("/initDress")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result initDress() {
		MyUser u = (MyUser) request.getSession().getAttribute("curUser");
		List<DressRecord> list = EM.getEntityManager().createNamedQuery("dress.getRecordByUsername", DressRecord.class)
		.setParameter("username", u.getUsername())
		.getResultList();
		List<InitDress> result = new ArrayList<>();
		for(DressRecord dr : list) {
			InitDress i = new InitDress();
			List<Clothing> list2 = EM.getEntityManager().createNamedQuery("cloth.getClothingByCode", Clothing.class)
			.setParameter("code", dr.getClothingCode()).getResultList();
			Clothing clothing = list2.get(0);
			i.setClothing(clothing);
			i.setZ_index(dr.getZ_index());
			i.setRecordID((int)dr.getId());
			result.add(i);
		}
		return new Result(0, "删除成功", result, "");
	}

}
