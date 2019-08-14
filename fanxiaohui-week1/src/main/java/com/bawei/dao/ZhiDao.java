package com.bawei.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.pojo.Zhi;

public interface ZhiDao {
	//查询全部+模糊
	List<Zhi> findAll(@Param("zname")String zname);
	//查询单个根据id
	Zhi findAllById(int zid);
	//根据id删除
	int delete(int zid);
	//添加
	int add(Zhi zhi);
	int addsg(@Param("zid")int zid,@Param("gid")int gid);//中间表添加
	//修改
	int update(Zhi zhi);
	int deletegs(int zid);//删除中间表
	
}
