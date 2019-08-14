package com.bawei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.pojo.Garden;
import com.bawei.service.GardenService;

@Controller
@RequestMapping("/Gardens")
public class GardenController {

	
	@Autowired
	private GardenService gardenService;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<Garden> findAll() {
		return gardenService.findAll();
	}
	
	
	
}
