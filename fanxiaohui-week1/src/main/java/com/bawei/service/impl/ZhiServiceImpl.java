package com.bawei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bawei.dao.ZhiDao;
import com.bawei.pojo.Zhi;
import com.bawei.service.ZhiService;
import com.github.pagehelper.PageHelper;
@Service
public class ZhiServiceImpl implements ZhiService{

	@Autowired
	private ZhiDao zhiDao;
	
	@Override
	public List<Zhi> findAll(String zname, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		return zhiDao.findAll(zname);
	}

	@Override
	public Zhi findAllById(int zid) {
		// TODO Auto-generated method stub
		return zhiDao.findAllById(zid);
	}

	@Override
	public int delete(int zid) {
		// TODO Auto-generated method stub
		return zhiDao.delete(zid);
	}

	@Override
	public int add(Zhi zhi) {
		zhiDao.add(zhi);
		
		String ids = zhi.getGname();
		int gid = Integer.parseInt(ids);
		addsg(zhi.getZid(),gid);
		
		return 0;
	}

	@Override
	public int addsg(int zid, int gid) {
		// TODO Auto-generated method stub
		return zhiDao.addsg(zid, gid);
	}

	@Override
	public int update(Zhi zhi) {
		zhiDao.update(zhi);
		deletegs(zhi.getZid());
		
		String ids = zhi.getGname();
		int gid = Integer.parseInt(ids);
		addsg(zhi.getZid(),gid);
		return 1;
	}

	@Override
	public int deletegs(int zid) {
		// TODO Auto-generated method stub
		return zhiDao.deletegs(zid);
	}

}
