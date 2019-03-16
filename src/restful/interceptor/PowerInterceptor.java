package restful.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;

import org.jboss.resteasy.core.Headers;
import org.jboss.resteasy.core.ResourceMethodInvoker;
import org.jboss.resteasy.core.ServerResponse;
import org.jboss.resteasy.spi.Failure;
import org.jboss.resteasy.spi.HttpRequest;
import org.jboss.resteasy.spi.interception.PreProcessInterceptor;

import restful.annotation.Power;
import restful.bean.Result;
import restful.entity.MyUser;

@SuppressWarnings("deprecation")
public class PowerInterceptor implements PreProcessInterceptor {
	@Context
	private HttpServletRequest request;

	@Override
	public ServerResponse preProcess(HttpRequest arg0, ResourceMethodInvoker invoker)
			throws Failure, WebApplicationException {
		Method method = invoker.getMethod();
		if(method.isAnnotationPresent(Power.class)) {
			Power anno = method.getAnnotation(Power.class);
			String power = anno.value();
			if("admin".equals(power)) {
				MyUser curUser = (MyUser)request.getSession().getAttribute("curUser");
				if(!"管理员".equals(curUser.getPower())){
					return new ServerResponse(new Result(-1, "权限不足，仅限管理员能操作！", "", ""), 200, new Headers<>());
				}
			}
		}
		return null;
	}

}
