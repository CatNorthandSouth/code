package cn.ts.service;

import cn.ts.entity.BsRoleMenu;

public interface BsRoleMenuService {
	BsRoleMenu selectByRoleId(Integer roleId);
	int insert(BsRoleMenu record);
}
