package com.wez.sims.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 默认控制器
 * @author wez
 *
 */
@Controller
@Scope("prototype")
public class DefaultController {

	@RequestMapping("/{page}")
	public String showStaticPage(@PathVariable String page) {
		return page;
	}
	
}
