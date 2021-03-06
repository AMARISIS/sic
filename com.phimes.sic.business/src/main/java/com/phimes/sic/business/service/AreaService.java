package com.phimes.sic.business.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;

import com.phimes.sic.api.dto.AreaDto;
import com.phimes.sic.api.service.IAreaService;
import com.phimes.sic.business.dao.AreaRepository;
import com.phimes.sic.business.model.Area;

@org.springframework.stereotype.Service
public class AreaService extends Service<Area, Long> implements IAreaService {

	@Autowired
	private AreaRepository rep;

	@Override
	protected CrudRepository getCrudRep() {
		return rep;
	}

	// FILTRO PER FILTRARE AreaDto
	ModelMapper modelMapper = new ModelMapper();

	public AreaDto getAreaDto(String username, String codeApp, String codeAr) {
		List<AreaDto> l = getAreaListDto(username, codeApp);
		AreaDto arDto = new AreaDto();
		for (AreaDto areaDto : l) {
			if (areaDto.getCode().equals(codeAr))
				arDto = areaDto;

		}
		return arDto;
	}

	public List<AreaDto> getAreaListDto(String username, String codeApp) {
		Set<Area> areaset = rep.getAreaList(username, codeApp);

		List<AreaDto> retList = new ArrayList<>();

		for (Area item : areaset) {
			AreaDto dto = modelMapper.map(item, AreaDto.class);
			retList.add(dto);
		}

		return retList;
	}
}