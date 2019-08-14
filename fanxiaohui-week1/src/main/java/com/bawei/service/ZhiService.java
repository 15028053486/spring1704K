package com.bawei.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.pojo.Zhi;

public interface ZhiService {
	List<Zhi> findAll(@Param("zname")String zname,Integer pageNum);
	Zhi findAllById(int zid);
	int delete(int zid);
	int add(Zhi zhi);
	//
	int addsg(@Param("zid")int zid,@Param("gid")int gid);
	int update(Zhi zhi);
	int deletegs(int zid);
}
