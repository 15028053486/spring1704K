package com.bawei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bawei.dao.GardenDao;
import com.bawei.pojo.Garden;
import com.bawei.service.GardenService;
@Service
public class GardenServiceImpl implements GardenService{

	@Autowired
	private GardenDao gardenDao;
	
	@Override
	public List<Garden> findAll() {
		// TODO Auto-generated method stub
		return gardenDao.findAll();
	}

}
