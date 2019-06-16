package cn.ts.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsLine;
import cn.ts.service.BsLineService;

@Controller
public class HbsLineController {

	@Autowired
	BsLineService bsLineService;
	
	@RequestMapping("selectBsLine")
	@ResponseBody()
	public Object selectBsLine(){
		System.out.println("折线图数据加载");
		List<BsLine> list=bsLineService.selectLine();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		//System.out.println(list.get(0));
		int size=list.size();
		/*if (size >= 7) {
			size=7;
		}*/
		
		String[] str=new String[7];
		int[] str1=new int[7];
		int t=0;
		for (int i = size-6; i < size; i++) {
			str[t]=format.format(list.get(i).getTime());
			str1[t]=list.get(i).getTotal();
			t++;
		/*	if (i == size-1) {
				str=str+format.format(list.get(i).getTime())+"']";
				str1=str1+list.get(i).getTotal()+"]";
			} else {
				str=str+format.format(list.get(i).getTime())+"','";
				str1=str1+list.get(i).getTotal()+",";
			}*/
		}
		
		List<Object> list1=new ArrayList<>();
		list1.add(0, str);
		list1.add(1, str1);
		return list1;
	}
	
}
