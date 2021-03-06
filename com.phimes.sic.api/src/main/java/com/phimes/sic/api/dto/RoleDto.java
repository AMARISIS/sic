package com.phimes.sic.api.dto;

import java.io.Serializable;
import java.util.Set;

import com.phimes.sic.api.dto.FunctionDto;
import com.phimes.sic.api.dto.MenuDto;

public class RoleDto implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -6936624245790924939L;

	private String code;

	private String description;

	private Set<FunctionDto> functions;

	private Set<MenuDto> menu;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<FunctionDto> getFunctions() {
		return functions;
	}

	public void setFunctions(Set<FunctionDto> functions) {
		this.functions = functions;
	}

	public Set<MenuDto> getMenu() {
		return menu;
	}

	public void setMenu(Set<MenuDto> menu) {
		this.menu = menu;
	}

}
