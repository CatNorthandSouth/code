package cn.ts.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsFilterWord;
import cn.ts.service.BsFilterWordService;

@Controller
public class HFilterWordController {

	@Autowired
	BsFilterWordService BsFilterWordService;
	
	@RequestMapping("insertFilterWord")
	@ResponseBody
	public Object insertFilterWord(@Param("text") String text){
		//String[] str=text.split("|");
		List<BsFilterWord> list = BsFilterWordService.selectByExample();
		if (list.size() != 0) {
			BsFilterWordService.deleteByExample();
		}
		System.out.println("插入敏感词"+text);
		BsFilterWord bsFilterWord=new BsFilterWord();
		bsFilterWord.setWord(text);
		int i = BsFilterWordService.insert(bsFilterWord);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	@RequestMapping("FilterWord")
	public String selectFilterWord(Model model){
		//String[] str=text.split("|");
		List<BsFilterWord> list = BsFilterWordService.selectByExample();
		String str=new String();
		if (list.size() > 0) {
			str=list.get(list.size()-1).getWord();
			System.out.println("获取敏感词"+str);
		} else {
			str="";
		}
		model.addAttribute("str", str);
		return "sys-shield";
	}
	
	
}
