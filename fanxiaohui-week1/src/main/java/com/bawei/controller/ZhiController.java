package com.bawei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.pojo.Zhi;
import com.bawei.service.ZhiService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/zhi")
public class ZhiController {

	@Autowired
	private ZhiService zhiService;
	
	@RequestMapping("/findAll")
	public String findAll(Model model, String zname,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum) {
		List<Zhi> list = zhiService.findAll(zname, pageNum);
		PageInfo<Zhi> info = new PageInfo<>(list);
		model.addAttribute("pi", info);
		return "list";
	}

	@RequestMapping("/findById")
	public String findById(int zid,Model model) {
		Zhi zhi = zhiService.findAllById(zid);
		model.addAttribute("list", zhi);
		return "look";
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public boolean delete(Integer[] zid) {
		for (Integer integer : zid) {
		 zhiService.delete(integer);
		 return true;
		}
		return false;
	}
	
	@RequestMapping("/add")
	public String add(Zhi zhi) {
		zhiService.add(zhi);
		return "redirect:/zhi/findAll";
	}
	
	
	@RequestMapping("/toupdate")
	public String toUpdate(Integer zid,Model model) {
		model.addAttribute("zid", zid);
		return "update";
	}
	
	@RequestMapping("/Byid")
	@ResponseBody
	public Zhi queryByid(Integer zid) {
		return zhiService.findAllById(zid);
	}
	
	@RequestMapping("/update")
	public String update(Zhi zhi) {
		zhiService.update(zhi);
		return "redirect:/zhi/findAll";
	}
	
}
