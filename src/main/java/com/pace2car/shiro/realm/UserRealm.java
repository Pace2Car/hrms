package com.pace2car.shiro.realm;

import com.pace2car.shiro.service.UserService;
import com.pace2car.shiro.bean.User;
import com.pace2car.shiro.service.PermissionService;
import com.pace2car.shiro.service.RoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/19 9:55
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @Override
    public String getName() {
        return "UserRealm";
    }

    /**
     * 授权
     *
     * @param principal
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {

        User user = (User) principal.getPrimaryPrincipal();

        List<String> userRoles = roleService.selectAllRolesByUsername(user.getUsername());

        List<String> permissions = permissionService.selectAllResourcesByUsername(user.getUsername());

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(userRoles);
        info.addStringPermissions(permissions);
        return info;
    }

    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //拿到登录的用户
        String username = (String) token.getPrincipal();
        User user = userService.selectByUsername(username);
        if (user == null) {
            return null;
        } else {
            user.setLastLoginTime(new Date(System.currentTimeMillis()));
            userService.updateByPrimaryKeySelective(user);
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getUsername()), getName());

        return info;
    }

    //清处缓存
    protected void clearCache() {
        PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
    }
}
