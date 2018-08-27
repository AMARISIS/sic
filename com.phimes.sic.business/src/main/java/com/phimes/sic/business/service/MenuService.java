package com.phimes.sic.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;

import com.phimes.sic.business.dao.MenuRepository;
import com.phimes.sic.business.dto.MenuDto;

@org.springframework.stereotype.Service
public class MenuService extends Service<MenuDto, Long> {

	@Autowired
	private MenuRepository rep;

	@Override
	protected CrudRepository getCrudRep() {

		return rep;
	}

}